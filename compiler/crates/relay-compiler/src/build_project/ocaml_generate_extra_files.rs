use std::fmt::Write;

use common::SourceLocationKey;
use graphql_ir::reexport::Intern;
use relay_config::ProjectConfig;
use relay_transforms::Programs;
use relay_typegen::ocaml_utils::{get_safe_key, print_type_reference};
use schema::{SDLSchema, Schema, TypeReference};

use crate::Artifact;

pub(crate) fn ocaml_generate_extra_artifacts(
    project_config: &ProjectConfig,
    schema: &SDLSchema,
    _programs: &Programs,
    _artifacts: &[Artifact],
) -> Vec<Artifact> {
    let dummy_source_file = SourceLocationKey::Generated;

    let mut content = String::from("(* @generated *)\n[@@@ocaml.warning \"-30\"]\n\n");

    // Write all enums
    schema.enums().for_each(|e| {
        if let Some(desc) = e.description {
            writeln!(content, "(** {} *)", desc).unwrap();
        }

        writeln!(content, "\ntype enum_{} = private [>", e.name.item).unwrap();
        e.values.iter().for_each(|v| {
            writeln!(content, "  | `{}", v.value).unwrap();
        });
        writeln!(content, "]\n").unwrap();

        if let Some(desc) = e.description {
            writeln!(content, "(** {} *)", desc).unwrap();
        }
        writeln!(content, "\ntype enum_{}_input = [", e.name.item).unwrap();
        e.values.iter().for_each(|v| {
            writeln!(content, "  | `{}", v.value).unwrap();
        });
        writeln!(content, "]\n").unwrap();
    });

    // Write the input object types
    let mut has_written_initial_input_obj = false;
    schema.input_objects().for_each(|input_obj| {
        // Write the regular types
        if let Some(desc) = input_obj.description {
            writeln!(content, "(** {} *)", desc).unwrap();
        }

        writeln!(
            content,
            "{} input_{} = {{",
            if has_written_initial_input_obj {
                "\nand"
            } else {
                "\ntype "
            },
            input_obj.name.item
        )
        .unwrap();

        input_obj.fields.iter().for_each(|field| {
            let (key, maybe_original_key) = get_safe_key(&field.name.to_string());

            writeln!(
                content,
                "  {}: {}{};",
                key,
                print_type_reference(
                    &field.type_,
                    &schema,
                    &project_config.typegen_config.custom_scalar_types,
                    true,
                    false,
                    false
                ),
                (match maybe_original_key {
                    Some(original_key) => format!(" [@mel.as \"{}\"]", original_key),
                    None => String::from(""),
                })
            )
            .unwrap();
        });

        writeln!(content, "}}").unwrap();

        if !has_written_initial_input_obj {
            has_written_initial_input_obj = true;
        }

        // Write the nullable type
        if let Some(desc) = input_obj.description {
            writeln!(content, "(** {} *)", desc).unwrap();
        }

        writeln!(
            content,
            "{} input_{}_nullable = {{",
            if has_written_initial_input_obj {
                "\nand"
            } else {
                "\ntype "
            },
            input_obj.name.item
        )
        .unwrap();

        input_obj.fields.iter().for_each(|field| {
            let (key, maybe_original_key) = get_safe_key(&field.name.to_string());

            let is_nullable = match &field.type_ {
                TypeReference::NonNull(_) => false,
                _ => true,
            };

            writeln!(
                content,
                "  {}: {}{}{};",
                key,
                print_type_reference(
                    &field.type_,
                    &schema,
                    &project_config.typegen_config.custom_scalar_types,
                    true,
                    false,
                    true
                ),
                if is_nullable {
                    " option [@mel.optional]"
                } else {
                    ""
                },
                (match maybe_original_key {
                    Some(original_key) => format!(" [@mel.as \"{}\"]", original_key),
                    None => String::from(""),
                }),
            )
            .unwrap();
        });

        writeln!(content, "}}").unwrap();

        if !has_written_initial_input_obj {
            has_written_initial_input_obj = true;
        }
    });
    if has_written_initial_input_obj {
        // Only need to add `[@@deriving abstract]` once at the end.
        writeln!(content, " [@@deriving abstract]").unwrap();
    }

    // Write object makers
    schema.input_objects().for_each(|input_obj| {
        writeln!(content, "external make_{}: ", input_obj.name.item).unwrap();

        let mut has_optional = false;

        input_obj.fields.iter().for_each(|arg| {
            let (key, maybe_original_key) = get_safe_key(&arg.name.to_string());

            let is_optional = match &arg.type_ {
                TypeReference::NonNull(_) => false,
                _ => true,
            };

            writeln!(
                content,
                "  {}{}: {} -> ",
                if is_optional { "?" } else { "" },
                (match maybe_original_key {
                    Some(original_key) => format!("_{}", original_key),
                    None => key,
                }),
                print_type_reference(
                    &arg.type_,
                    &schema,
                    &project_config.typegen_config.custom_scalar_types,
                    false,
                    false,
                    false
                ),
            )
            .unwrap();

            if !has_optional && is_optional {
                has_optional = true
            }
        });

        if has_optional {
            writeln!(content, "  unit ->").unwrap()
        }

        writeln!(
            content,
            " input_{} = \"\" [@@mel.obj]\n",
            input_obj.name.item
        )
        .unwrap();
    });

    vec![Artifact {
        artifact_source_keys: vec![],
        path: project_config.path_for_artifact(dummy_source_file, "RelaySchemaAssets".intern()),
        source_file: dummy_source_file,
        content: crate::ArtifactContent::Generic {
            content: content.as_bytes().to_vec(),
        },
    }]
}