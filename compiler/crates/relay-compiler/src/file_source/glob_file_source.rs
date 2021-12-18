/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

use std::collections::HashSet;
use std::path::{Path, PathBuf};

use crate::errors::Result;
use crate::FileSourceResult;
use crate::{compiler_state::CompilerState, config::Config};
use common::{PerfLogEvent, PerfLogger};
use glob::Pattern;
use log::debug;
use relay_typegen::TypegenLanguage;
use walkdir::WalkDir;

use super::File;

#[derive(Debug)]
pub struct GlobFileSourceResult {
    pub files: Vec<File>,
    pub resolved_root: PathBuf,
}

pub struct GlobFileSource<'config> {
    pub config: &'config Config,
    expected_file_extensions: HashSet<&'config str>,
    exclude_patterns: Vec<Pattern>,
}

impl<'config> GlobFileSource<'config> {
    pub fn new(config: &'config Config) -> Self {
        debug!(
            "Watchman server is disabled, or not available. Using GlobFileSource to find files."
        );
        Self {
            config,
            expected_file_extensions: GlobFileSource::get_expected_file_extensions(config),
            exclude_patterns: GlobFileSource::get_exclude_patterns(config),
        }
    }

    fn get_expected_file_extensions(config: &Config) -> HashSet<&str> {
        let mut file_extensions = HashSet::<&str>::with_capacity(5);
        file_extensions.insert("graphql");
        for project in config.enabled_projects() {
            match project.typegen_config.language {
                TypegenLanguage::ReScript => {
                    file_extensions.insert("res");
                }
                TypegenLanguage::Flow => {
                    file_extensions.insert("js");
                    file_extensions.insert("jsx");
                }
                TypegenLanguage::TypeScript => {
                    file_extensions.insert("js");
                    file_extensions.insert("jsx");
                    file_extensions.insert("ts");
                    file_extensions.insert("tsx");
                }
            }
        }
        file_extensions
    }

    fn get_exclude_patterns(config: &Config) -> Vec<Pattern> {
        config
            .excludes
            .iter()
            .map(|exclude| Pattern::new(exclude).unwrap_or_else(|err| panic!("{}", err.msg)))
            .collect()
    }

    fn should_include_file(&self, name: &Path) -> bool {
        if !name.is_file() {
            return false;
        }
        if self
            .exclude_patterns
            .iter()
            .any(|exclude_pattern| exclude_pattern.matches_path(name))
        {
            return false;
        }
        matches!(
            name.extension().map(|extension| self
                .expected_file_extensions
                .contains(extension.to_str().unwrap())),
            Some(true)
        )
    }

    fn find_files(&self) -> Vec<File> {
        WalkDir::new(self.config.root_dir.clone())
            .into_iter()
            .filter_map(|entry| {
                let dir_entry = entry.ok()?;
                self.should_include_file(dir_entry.path()).then(|| {
                    let name = dir_entry
                        .path()
                        .strip_prefix(self.config.root_dir.clone())
                        .unwrap()
                        .to_path_buf();
                    File { name, exists: true }
                })
            })
            .collect::<Vec<_>>()
    }

    pub fn create_compiler_state(&self, perf_logger: &impl PerfLogger) -> Result<CompilerState> {
        let setup_event = perf_logger.create_event("Glob_file_source_create_compiler_state");
        let timer = setup_event.start("create_compiler_state_file_files");
        let file_source_changes = FileSourceResult::Glob(GlobFileSourceResult {
            files: self.find_files(),
            resolved_root: self.config.root_dir.clone(),
        });
        setup_event.stop(timer);
        let compiler_state = CompilerState::from_file_source_changes(
            self.config,
            &file_source_changes,
            &setup_event,
            perf_logger,
        )?;

        setup_event.complete();

        Ok(compiler_state)
    }
}
