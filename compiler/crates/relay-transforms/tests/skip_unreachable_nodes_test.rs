/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * @generated SignedSource<<90e95fbfbf9affaf1264bd92956f97cc>>
 */

mod skip_unreachable_nodes;

use skip_unreachable_nodes::transform_fixture;
use fixture_tests::test_fixture;

#[tokio::test]
async fn keeps_other_fields() {
    let input = include_str!("skip_unreachable_nodes/fixtures/keeps-other-fields.graphql");
    let expected = include_str!("skip_unreachable_nodes/fixtures/keeps-other-fields.expected");
    test_fixture(transform_fixture, "keeps-other-fields.graphql", "skip_unreachable_nodes/fixtures/keeps-other-fields.expected", input, expected).await;
}

#[tokio::test]
async fn removes_include_false() {
    let input = include_str!("skip_unreachable_nodes/fixtures/removes-include-false.graphql");
    let expected = include_str!("skip_unreachable_nodes/fixtures/removes-include-false.expected");
    test_fixture(transform_fixture, "removes-include-false.graphql", "skip_unreachable_nodes/fixtures/removes-include-false.expected", input, expected).await;
}

#[tokio::test]
async fn removes_recursively_empty_definitions() {
    let input = include_str!("skip_unreachable_nodes/fixtures/removes-recursively-empty-definitions.graphql");
    let expected = include_str!("skip_unreachable_nodes/fixtures/removes-recursively-empty-definitions.expected");
    test_fixture(transform_fixture, "removes-recursively-empty-definitions.graphql", "skip_unreachable_nodes/fixtures/removes-recursively-empty-definitions.expected", input, expected).await;
}

#[tokio::test]
async fn removes_skip_true() {
    let input = include_str!("skip_unreachable_nodes/fixtures/removes-skip-true.graphql");
    let expected = include_str!("skip_unreachable_nodes/fixtures/removes-skip-true.expected");
    test_fixture(transform_fixture, "removes-skip-true.graphql", "skip_unreachable_nodes/fixtures/removes-skip-true.expected", input, expected).await;
}

#[tokio::test]
async fn skipped_fragment() {
    let input = include_str!("skip_unreachable_nodes/fixtures/skipped-fragment.graphql");
    let expected = include_str!("skip_unreachable_nodes/fixtures/skipped-fragment.expected");
    test_fixture(transform_fixture, "skipped-fragment.graphql", "skip_unreachable_nodes/fixtures/skipped-fragment.expected", input, expected).await;
}
