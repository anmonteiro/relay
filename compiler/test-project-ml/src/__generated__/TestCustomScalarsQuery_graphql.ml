(* @sourceLoc Test_customScalars.ml *)
(* @generated *)
[%%mel.raw "/* @generated */"]
module Types = struct
  [@@@ocaml.warning "-30"]

  type response_member_User = {
    __typename: [ | `User] [@live];
    createdAt: SomeModule.Datetime.t;
    datetimes: SomeModule.Datetime.t option array option;
    onlineStatus: RelaySchemaAssets_graphql.enum_OnlineStatus option;
    onlineStatus2: RelaySchemaAssets_graphql.enum_OnlineStatus option;
  }
  and response_member = [
    | `User of response_member_User
    | `UnselectedUnionMember of string
  ]

  type response_loggedInUser_friends = {
    createdAt: SomeModule.Datetime.t;
  }
  and response_loggedInUser = {
    createdAt: SomeModule.Datetime.t;
    datetimes: SomeModule.Datetime.t option array option;
    friends: response_loggedInUser_friends array;
    onlineStatus: RelaySchemaAssets_graphql.enum_OnlineStatus option;
    onlineStatus2: RelaySchemaAssets_graphql.enum_OnlineStatus option;
  }
  type response = {
    loggedInUser: response_loggedInUser;
    member: response_member option;
  }
  type rawResponse = response
  type variables = {
    beforeDate: SomeModule.Datetime.t option;
    datetimes: SomeModule.Datetime.t array option;
  }
  type refetchVariables = {
    beforeDate: SomeModule.Datetime.t option option;
    datetimes: SomeModule.Datetime.t array option option;
  }
  let makeRefetchVariables 
    ?beforeDate 
    ?datetimes 
    ()
  : refetchVariables = {
    beforeDate= beforeDate;
    datetimes= datetimes
  }

end

let unwrap_response_member: < __typename: string > Js.t -> [
  | `User of Types.response_member_User
  | `UnselectedUnionMember of string
] = fun u -> match u##__typename with 
  | "User" -> `User (Obj.magic u)
  | v -> `UnselectedUnionMember v
let wrap_response_member: [
  | `User of Types.response_member_User
  | `UnselectedUnionMember of string
] -> < __typename: string > Js.t = function 
  | `User(v) -> Obj.magic v
  | `UnselectedUnionMember v -> [%mel.obj { __typename = v }]

type queryRef

module Internal = struct
  let variablesConverter: string Js.Dict.t Js.Dict.t Js.Dict.t = [%mel.raw 
    {json|{"__root":{"datetimes":{"ca":"SomeModule.Datetime"},"beforeDate":{"c":"SomeModule.Datetime"}}}|json}
  ]
  let variablesConverterMap = let o = Js.Dict.empty () in 
    Js.Dict.set o "SomeModule.Datetime" (Obj.magic SomeModule.Datetime.serialize : unit);
  o
  let convertVariables v = Melange_relay.convertObj v 
    variablesConverter 
    variablesConverterMap 
    Js.undefined
    type wrapResponseRaw
  let wrapResponseConverter: string Js.Dict.t Js.Dict.t Js.Dict.t = [%mel.raw 
    {json|{"__root":{"member_User_datetimes":{"ca":"SomeModule.Datetime"},"member_User_createdAt":{"c":"SomeModule.Datetime"},"member":{"u":"response_member"},"loggedInUser_friends_createdAt":{"c":"SomeModule.Datetime"},"loggedInUser_datetimes":{"ca":"SomeModule.Datetime"},"loggedInUser_createdAt":{"c":"SomeModule.Datetime"}}}|json}
  ]
  let wrapResponseConverterMap = let o = Js.Dict.empty () in 
    Js.Dict.set o "SomeModule.Datetime" (Obj.magic SomeModule.Datetime.serialize : unit);
    Js.Dict.set o "response_member" (Obj.magic wrap_response_member : unit);
  o
  let convertWrapResponse v = Melange_relay.convertObj v 
    wrapResponseConverter 
    wrapResponseConverterMap 
    Js.null
    type responseRaw
  let responseConverter: string Js.Dict.t Js.Dict.t Js.Dict.t = [%mel.raw 
    {json|{"__root":{"member_User_datetimes":{"ca":"SomeModule.Datetime"},"member_User_createdAt":{"c":"SomeModule.Datetime"},"member":{"u":"response_member"},"loggedInUser_friends_createdAt":{"c":"SomeModule.Datetime"},"loggedInUser_datetimes":{"ca":"SomeModule.Datetime"},"loggedInUser_createdAt":{"c":"SomeModule.Datetime"}}}|json}
  ]
  let responseConverterMap = let o = Js.Dict.empty () in 
    Js.Dict.set o "SomeModule.Datetime" (Obj.magic SomeModule.Datetime.parse : unit);
    Js.Dict.set o "response_member" (Obj.magic unwrap_response_member : unit);
  o
  let convertResponse v = Melange_relay.convertObj v 
    responseConverter 
    responseConverterMap 
    Js.undefined
    type wrapRawResponseRaw = wrapResponseRaw
  let convertWrapRawResponse = convertWrapResponse
  type rawResponseRaw = responseRaw
  let convertRawResponse = convertResponse
  type 'response rawPreloadToken = {source: 'response Melange_relay.Observable.t Js.Nullable.t}
  external tokenToRaw: queryRef -> Types.response rawPreloadToken = "%identity"
end
module Utils = struct
  [@@@ocaml.warning "-33"]
  open Types
  external onlineStatus_toString: RelaySchemaAssets_graphql.enum_OnlineStatus -> string = "%identity"
  external onlineStatus_input_toString: RelaySchemaAssets_graphql.enum_OnlineStatus_input -> string = "%identity"
  let onlineStatus_decode (enum: RelaySchemaAssets_graphql.enum_OnlineStatus): RelaySchemaAssets_graphql.enum_OnlineStatus_input option =
    (match enum with
      | #RelaySchemaAssets_graphql.enum_OnlineStatus_input as valid -> Some(valid)
      | _ -> None
    )
    let onlineStatus_fromString (str: string): RelaySchemaAssets_graphql.enum_OnlineStatus_input option =
    onlineStatus_decode (Obj.magic str)
    external makeVariables:     ?beforeDate: SomeModule.Datetime.t-> 
    ?datetimes: SomeModule.Datetime.t array-> 
    unit ->
   variables = "" [@@mel.obj]


end

type relayOperationNode
type operationType = relayOperationNode Melange_relay.queryNode


let node: operationType = [%mel.raw {json| (function(){
var v0 = [
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "beforeDate"
  },
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "datetimes"
  }
],
v1 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "createdAt",
  "storageKey": null
},
v2 = [
  {
    "kind": "Variable",
    "name": "beforeDate",
    "variableName": "beforeDate"
  }
],
v3 = {
  "alias": null,
  "args": [
    {
      "kind": "Literal",
      "name": "dateTimes",
      "value": [
        "2024-01-17T00:00:00.000Z"
      ]
    }
  ],
  "kind": "ScalarField",
  "name": "onlineStatus",
  "storageKey": "onlineStatus(dateTimes:[\"2024-01-17T00:00:00.000Z\"])"
},
v4 = {
  "alias": "onlineStatus2",
  "args": [
    {
      "kind": "Variable",
      "name": "dateTimes",
      "variableName": "datetimes"
    }
  ],
  "kind": "ScalarField",
  "name": "onlineStatus",
  "storageKey": null
},
v5 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "datetimes",
  "storageKey": null
},
v6 = [
  {
    "kind": "Literal",
    "name": "id",
    "value": "user-1"
  }
],
v7 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "__typename",
  "storageKey": null
},
v8 = {
  "kind": "InlineFragment",
  "selections": [
    (v1/*: any*/),
    (v3/*: any*/),
    (v4/*: any*/),
    (v5/*: any*/)
  ],
  "type": "User",
  "abstractKey": null
},
v9 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Fragment",
    "metadata": null,
    "name": "TestCustomScalarsQuery",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "User",
        "kind": "LinkedField",
        "name": "loggedInUser",
        "plural": false,
        "selections": [
          (v1/*: any*/),
          {
            "alias": null,
            "args": (v2/*: any*/),
            "concreteType": "User",
            "kind": "LinkedField",
            "name": "friends",
            "plural": true,
            "selections": [
              (v1/*: any*/)
            ],
            "storageKey": null
          },
          (v3/*: any*/),
          (v4/*: any*/),
          (v5/*: any*/)
        ],
        "storageKey": null
      },
      {
        "alias": null,
        "args": (v6/*: any*/),
        "concreteType": null,
        "kind": "LinkedField",
        "name": "member",
        "plural": false,
        "selections": [
          (v7/*: any*/),
          (v8/*: any*/)
        ],
        "storageKey": "member(id:\"user-1\")"
      }
    ],
    "type": "Query",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Operation",
    "name": "TestCustomScalarsQuery",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "User",
        "kind": "LinkedField",
        "name": "loggedInUser",
        "plural": false,
        "selections": [
          (v1/*: any*/),
          {
            "alias": null,
            "args": (v2/*: any*/),
            "concreteType": "User",
            "kind": "LinkedField",
            "name": "friends",
            "plural": true,
            "selections": [
              (v1/*: any*/),
              (v9/*: any*/)
            ],
            "storageKey": null
          },
          (v3/*: any*/),
          (v4/*: any*/),
          (v5/*: any*/),
          (v9/*: any*/)
        ],
        "storageKey": null
      },
      {
        "alias": null,
        "args": (v6/*: any*/),
        "concreteType": null,
        "kind": "LinkedField",
        "name": "member",
        "plural": false,
        "selections": [
          (v7/*: any*/),
          (v8/*: any*/),
          {
            "kind": "InlineFragment",
            "selections": [
              (v9/*: any*/)
            ],
            "type": "Node",
            "abstractKey": "__isNode"
          }
        ],
        "storageKey": "member(id:\"user-1\")"
      }
    ]
  },
  "params": {
    "cacheID": "8b5300555c66b30ce2d4cf8c838f99a6",
    "id": null,
    "metadata": {},
    "name": "TestCustomScalarsQuery",
    "operationKind": "query",
    "text": "query TestCustomScalarsQuery(\n  $beforeDate: Datetime\n  $datetimes: [Datetime!]\n) {\n  loggedInUser {\n    createdAt\n    friends(beforeDate: $beforeDate) {\n      createdAt\n      id\n    }\n    onlineStatus(dateTimes: [\"2024-01-17T00:00:00.000Z\"])\n    onlineStatus2: onlineStatus(dateTimes: $datetimes)\n    datetimes\n    id\n  }\n  member(id: \"user-1\") {\n    __typename\n    ... on User {\n      createdAt\n      onlineStatus(dateTimes: [\"2024-01-17T00:00:00.000Z\"])\n      onlineStatus2: onlineStatus(dateTimes: $datetimes)\n      datetimes\n    }\n    ... on Node {\n      __isNode: __typename\n      __typename\n      id\n    }\n  }\n}\n"
  }
};
})() |json}]

let (load :
    environment:Melange_relay.Environment.t
    -> variables:Types.variables
    -> ?fetchPolicy:Melange_relay.FetchPolicy.t
    -> ?fetchKey:string
    -> ?networkCacheConfig:Melange_relay.cacheConfig
    -> unit
    -> queryRef)
=
fun ~environment ~variables ?fetchPolicy ?fetchKey ?networkCacheConfig () ->
  Melange_relay.loadQuery
    environment
    node
    (variables |. Internal.convertVariables)
    { fetchKey
    ; fetchPolicy = fetchPolicy |. Melange_relay.FetchPolicy.map
    ; networkCacheConfig
    }

type nonrec 'response rawPreloadToken =
  { source : 'response Melange_relay.Observable.t Js.Nullable.t }

let queryRefToObservable token =
  let raw = token |. Internal.tokenToRaw in
  raw.source |. Js.Nullable.toOption

let queryRefToPromise token =
  Js.Promise.make (fun ~resolve ~reject:_ ->
      match token |. queryRefToObservable with
      | None -> resolve (Error ()) [@u]
      | Some o ->
        let open Melange_relay.Observable in
        let (_ : subscription) =
          o
          |. subscribe
               (makeObserver ~complete:(fun () -> (resolve (Ok ()) [@u])) ())
        in
        ())

