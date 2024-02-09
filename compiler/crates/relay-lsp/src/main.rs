/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

use common::ConsoleLogger;
use env_logger::Env;
use log::{error, info, Level};
use relay_compiler::{
    config::{Config, SingleProjectConfigFile},
    FileSourceKind,
};
use relay_lsp::{start_language_server, LSPExtraDataProvider};
use schema::SDLSchema;
use std::io::Write;
use std::{
    env::{self, current_dir},
    path::PathBuf,
    process::Command,
    sync::Arc,
};
use structopt::StructOpt;

#[derive(StructOpt)]
#[structopt(
    name = "Relay Compiler",
    about = "Compiler to produce Relay generated files.",
    rename_all = "camel_case"
)]
struct Opt {
    /// Compile and watch for changes
    #[structopt(long, short)]
    watch: bool,

    /// Compile using this config file. If not provided, searches for a config in
    /// package.json under the `relay` key or `relay.config.json` files among other up
    /// from the current working directory.
    config: Option<PathBuf>,

    #[structopt(flatten)]
    cli_config: CliConfig,
}

#[derive(StructOpt)]
#[structopt(rename_all = "camel_case")]
pub struct CliConfig {
    /// Path for the directory where to search for source code
    #[structopt(long)]
    pub src: Option<PathBuf>,
    /// Path to schema file
    #[structopt(long)]
    pub schema: Option<PathBuf>,
    /// Path to a directory, where the compiler should write artifacts
    #[structopt(long)]
    pub artifact_directory: Option<PathBuf>,
}

impl CliConfig {
    pub fn is_defined(&self) -> bool {
        self.src.is_some() || self.schema.is_some() || self.artifact_directory.is_some()
    }
}

impl From<CliConfig> for SingleProjectConfigFile {
    fn from(cli_config: CliConfig) -> Self {
        SingleProjectConfigFile {
            schema: cli_config.schema.expect("schema is required."),
            artifact_directory: cli_config.artifact_directory,
            src: cli_config.src.unwrap_or_else(|| PathBuf::from("./")),
            ..Default::default()
        }
    }
}

struct ExtraDataProvider {}

impl LSPExtraDataProvider for ExtraDataProvider {
    fn fetch_query_stats(&self, _search_token: &str) -> Vec<String> {
        vec![]
    }

    fn resolve_field_definition(
        &self,
        _project_name: String,
        _parent_type: String,
        _field_info: Option<relay_lsp::FieldSchemaInfo>,
    ) -> Result<Option<relay_lsp::FieldDefinitionSourceInfo>, String> {
        Ok(None)
    }
}

#[tokio::main]
async fn main() {
    env_logger::Builder::from_env(Env::default().default_filter_or("info"))
        .format(|buf, record| {
            let style = buf.default_level_style(record.level());
            if record.level() == Level::Info {
                writeln!(buf, "{}", record.args())
            } else {
                writeln!(buf, "[{}] {}", style.value(record.level()), record.args())
            }
        })
        .init();

    let opt = Opt::from_args();

    let config_result = if let Some(config_path) = opt.config {
        Config::load(config_path)
    } else if opt.cli_config.is_defined() {
        Ok(Config::from(SingleProjectConfigFile::from(opt.cli_config)))
    } else {
        Config::search(&current_dir().expect("Unable to get current working directory."))
    };

    let mut config = config_result.unwrap_or_else(|err| {
        error!("{}", err);
        std::process::exit(1);
    });
    config.file_source_config = if should_use_watchman() {
        FileSourceKind::Watchman
    } else {
        FileSourceKind::WalkDir
    };

    if opt.watch && !matches!(&config.file_source_config, FileSourceKind::Watchman) {
        panic!(
            "Cannot run relay in watch mode if `watchman` is not available (or explicitly disabled)."
        );
    }

    match start_language_server::<ConsoleLogger, SDLSchema>(
        config,
        Arc::new(ConsoleLogger),
        Box::new(ExtraDataProvider {}),
        None,
        None,
    )
    .await
    {
        Ok(_compiler_state) => {
            info!("Done");
        }
        Err(_err) => {
            std::process::exit(1);
        }
    }
}

/// Check if `watchman` is available.
/// Additionally, this method is checking for an existence of `FORCE_NO_WATCHMAN`
/// environment variable. If this `FORCE_NO_WATCHMAN` is set, this method will return `false`
/// and compiler will use non-watchman file finder.
fn should_use_watchman() -> bool {
    let check_watchman = Command::new("watchman")
        .args(["list-capabilities"])
        .output();

    check_watchman.is_ok() && env::var("FORCE_NO_WATCHMAN").is_err()
}
