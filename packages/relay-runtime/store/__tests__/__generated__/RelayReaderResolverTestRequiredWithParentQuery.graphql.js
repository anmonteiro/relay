/**
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * @generated SignedSource<<48d1322d526decd91ab520b774150778>>
 * @flow
 * @lightSyntaxTransform
 * @nogrep
 */

/* eslint-disable */

'use strict';

/*::
import type { ConcreteRequest, Query } from 'relay-runtime';
type UserRequiredNameResolver$key = any;
import userRequiredNameResolver from "../resolvers/UserRequiredNameResolver.js";
// Type assertion validating that `userRequiredNameResolver` resolver is correctly implemented.
// A type error here indicates that the type signature of the resolver module is incorrect.
(userRequiredNameResolver: (
  rootKey: UserRequiredNameResolver$key, 
) => mixed);
export type RelayReaderResolverTestRequiredWithParentQuery$variables = {||};
export type RelayReaderResolverTestRequiredWithParentQuery$data = {|
  +me: ?{|
    +lastName: string,
    +required_name: ?$Call<<R>((...empty[]) => R) => R, typeof userRequiredNameResolver>,
  |},
|};
export type RelayReaderResolverTestRequiredWithParentQuery = {|
  response: RelayReaderResolverTestRequiredWithParentQuery$data,
  variables: RelayReaderResolverTestRequiredWithParentQuery$variables,
|};
*/

var node/*: ConcreteRequest*/ = (function(){
var v0 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "lastName",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": [],
    "kind": "Fragment",
    "metadata": null,
    "name": "RelayReaderResolverTestRequiredWithParentQuery",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "User",
        "kind": "LinkedField",
        "name": "me",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": null,
            "fragment": {
              "args": null,
              "kind": "FragmentSpread",
              "name": "UserRequiredNameResolver"
            },
            "kind": "RelayResolver",
            "name": "required_name",
            "resolverModule": require('./../resolvers/UserRequiredNameResolver.js'),
            "path": "me.required_name"
          },
          {
            "kind": "RequiredField",
            "field": (v0/*: any*/),
            "action": "LOG",
            "path": "me.lastName"
          }
        ],
        "storageKey": null
      }
    ],
    "type": "Query",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [],
    "kind": "Operation",
    "name": "RelayReaderResolverTestRequiredWithParentQuery",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "User",
        "kind": "LinkedField",
        "name": "me",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": null,
            "kind": "ScalarField",
            "name": "name",
            "storageKey": null
          },
          (v0/*: any*/),
          {
            "alias": null,
            "args": null,
            "kind": "ScalarField",
            "name": "id",
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "a8d8118478e5b51f03e3a9428cf7e1d6",
    "id": null,
    "metadata": {},
    "name": "RelayReaderResolverTestRequiredWithParentQuery",
    "operationKind": "query",
    "text": "query RelayReaderResolverTestRequiredWithParentQuery {\n  me {\n    ...UserRequiredNameResolver\n    lastName\n    id\n  }\n}\n\nfragment UserRequiredNameResolver on User {\n  name\n}\n"
  }
};
})();

if (__DEV__) {
  (node/*: any*/).hash = "a6891d63749d7987762c465731697f81";
}

module.exports = ((node/*: any*/)/*: Query<
  RelayReaderResolverTestRequiredWithParentQuery$variables,
  RelayReaderResolverTestRequiredWithParentQuery$data,
>*/);
