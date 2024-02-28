(* @sourceLoc Test_preloadedQuery.re *)
(* @generated *)
[%%mel.raw "/* @generated */"]
// @relayRequestID e2103af665a0e792e8f00f56ebb0c3e4

module Types = struct
  [@@@ocaml.warning "-30"]

  type someInput = RelaySchemaAssets_graphql.input_SomeInput
  type inputB = RelaySchemaAssets_graphql.input_InputB
  type inputA = RelaySchemaAssets_graphql.input_InputA
  type response_loggedInUser = {
    fragmentRefs: [ | `TestPreloadedQuery_user] Melange_relay.fragmentRefs;
  }
  and response_users_edges_node = {
    firstName: string;
    id: string [@live];
    onlineStatus: RelaySchemaAssets_graphql.enum_OnlineStatus option;
  }
  and response_users_edges = {
    node: response_users_edges_node option;
  }
  and response_users = {
    edges: response_users_edges option array option;
  }
  type response = {
    loggedInUser: response_loggedInUser;
    users: response_users option;
  }
  type rawResponse = response
  type variables = {
    status: [
      | `Idle
      | `Offline
      | `Online
    ] option;
  }
  type refetchVariables = {
    status: [
      | `Idle
      | `Offline
      | `Online
    ] option option;
  }
  let makeRefetchVariables 
    ?status 
    ()
  : refetchVariables = {
    status= status
  }

end


type queryRef

module Internal = struct
  let variablesConverter: string Js.Dict.t Js.Dict.t Js.Dict.t = [%mel.raw 
    {json|{"someInput":{"recursive":{"r":"someInput"},"datetime":{"c":"SomeModule.Datetime"}},"inputA":{"usingB":{"r":"inputB"},"timestamps":{"b":"a"},"timestamp":{"b":""},"time":{"c":"SomeModule.Datetime"},"recursiveA":{"r":"inputA"}},"inputB":{"usingA":{"r":"inputA"},"time":{"c":"SomeModule.Datetime"}},"__root":{"__relay_internal__pv__TestProvidedVariablesSomeInput":{"r":"someInput"},"__relay_internal__pv__TestProvidedVariablesInputB":{"r":"inputB"},"__relay_internal__pv__TestProvidedVariablesDatetimes":{"ca":"SomeModule.Datetime"},"__relay_internal__pv__TestProvidedVariablesDatetime":{"c":"SomeModule.Datetime"}}}|json}
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
    {json|{"__root":{"loggedInUser":{"f":""}}}|json}
  ]
  let wrapResponseConverterMap = ()
  let convertWrapResponse v = Melange_relay.convertObj v 
    wrapResponseConverter 
    wrapResponseConverterMap 
    Js.null
    type responseRaw
  let responseConverter: string Js.Dict.t Js.Dict.t Js.Dict.t = [%mel.raw 
    {json|{"__root":{"loggedInUser":{"f":""}}}|json}
  ]
  let responseConverterMap = ()
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
    external make_someInput:     ?bool: bool-> 
    ?datetime: SomeModule.Datetime.t-> 
    ?float: float-> 
    ?int: int-> 
    ?_private: bool-> 
    ?recursive: someInput-> 
    ?str: string-> 
    unit ->
   someInput = "" [@@mel.obj]


  external make_inputB:     ?_constraint: bool-> 
    ?time: SomeModule.Datetime.t-> 
    ?usingA: inputA-> 
    unit ->
   inputB = "" [@@mel.obj]


  external make_inputA:     ?recursiveA: inputA-> 
    time: SomeModule.Datetime.t-> 
    ?timestamp: Timestamp.t-> 
    ?timestamps: Timestamp.t option array-> 
    ?unmapped: Melange_relay.any-> 
    ?usingB: inputB-> 
    unit ->
   inputA = "" [@@mel.obj]


  external makeVariables:     ?status: [
      | `Idle
      | `Offline
      | `Online
    ]-> 
    unit ->
   variables = "" [@@mel.obj]


end
type 't providedVariable = { providedVariable: unit -> 't; get: unit -> 't }
type providedVariablesType = {
  __relay_internal__pv__TestProvidedVariablesBool: bool providedVariable;
  __relay_internal__pv__TestProvidedVariablesDatetime: SomeModule.Datetime.t option providedVariable;
  __relay_internal__pv__TestProvidedVariablesDatetimes: SomeModule.Datetime.t array option providedVariable;
  __relay_internal__pv__TestProvidedVariablesFloat: float providedVariable;
  __relay_internal__pv__TestProvidedVariablesID: string option providedVariable;
  __relay_internal__pv__TestProvidedVariablesInputB: RelaySchemaAssets_graphql.input_InputB providedVariable;
  __relay_internal__pv__TestProvidedVariablesInt: int option providedVariable;
  __relay_internal__pv__TestProvidedVariablesSomeInput: RelaySchemaAssets_graphql.input_SomeInput providedVariable;
  __relay_internal__pv__TestProvidedVariablesStr: string providedVariable;
}
let providedVariablesDefinition: providedVariablesType = {
  __relay_internal__pv__TestProvidedVariablesSomeInput = {
    providedVariable = TestProvidedVariables.SomeInput.get;
    get = (fun () -> Internal.convertVariables (Js.Dict.fromArray [|("__relay_internal__pv__TestProvidedVariablesSomeInput", TestProvidedVariables.SomeInput.get())|]) |. Js.Dict.unsafeGet "__relay_internal__pv__TestProvidedVariablesSomeInput");
  };
  __relay_internal__pv__TestProvidedVariablesInputB = {
    providedVariable = TestProvidedVariables.InputB.get;
    get = (fun () -> Internal.convertVariables (Js.Dict.fromArray [|("__relay_internal__pv__TestProvidedVariablesInputB", TestProvidedVariables.InputB.get())|]) |. Js.Dict.unsafeGet "__relay_internal__pv__TestProvidedVariablesInputB");
  };
  __relay_internal__pv__TestProvidedVariablesBool = {
    providedVariable = TestProvidedVariables.Bool.get;
    get = TestProvidedVariables.Bool.get;
  };
  __relay_internal__pv__TestProvidedVariablesStr = {
    providedVariable = TestProvidedVariables.Str.get;
    get = TestProvidedVariables.Str.get;
  };
  __relay_internal__pv__TestProvidedVariablesFloat = {
    providedVariable = TestProvidedVariables.Float.get;
    get = TestProvidedVariables.Float.get;
  };
  __relay_internal__pv__TestProvidedVariablesInt = {
    providedVariable = TestProvidedVariables.Int.get;
    get = TestProvidedVariables.Int.get;
  };
  __relay_internal__pv__TestProvidedVariablesID = {
    providedVariable = TestProvidedVariables.ID.get;
    get = TestProvidedVariables.ID.get;
  };
  __relay_internal__pv__TestProvidedVariablesDatetime = {
    providedVariable = TestProvidedVariables.Datetime.get;
    get = (fun () -> Internal.convertVariables (Js.Dict.fromArray [|("__relay_internal__pv__TestProvidedVariablesDatetime", TestProvidedVariables.Datetime.get())|]) |. Js.Dict.unsafeGet "__relay_internal__pv__TestProvidedVariablesDatetime");
  };
  __relay_internal__pv__TestProvidedVariablesDatetimes = {
    providedVariable = TestProvidedVariables.Datetimes.get;
    get = (fun () -> Internal.convertVariables (Js.Dict.fromArray [|("__relay_internal__pv__TestProvidedVariablesDatetimes", TestProvidedVariables.Datetimes.get())|]) |. Js.Dict.unsafeGet "__relay_internal__pv__TestProvidedVariablesDatetimes");
  };
}

type relayOperationNode
type operationType = relayOperationNode Melange_relay.queryNode


[%%private let makeNode providedVariablesDefinition: operationType = 
  ignore providedVariablesDefinition;
  [%raw {json|(function(){
var v0 = {
  "defaultValue": null,
  "kind": "LocalArgument",
  "name": "status"
},
v1 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
},
v2 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "firstName",
  "storageKey": null
},
v3 = {
  "alias": null,
  "args": [
    {
      "kind": "Variable",
      "name": "status",
      "variableName": "status"
    }
  ],
  "concreteType": "UserConnection",
  "kind": "LinkedField",
  "name": "users",
  "plural": false,
  "selections": [
    {
      "alias": null,
      "args": null,
      "concreteType": "UserEdge",
      "kind": "LinkedField",
      "name": "edges",
      "plural": true,
      "selections": [
        {
          "alias": null,
          "args": null,
          "concreteType": "User",
          "kind": "LinkedField",
          "name": "node",
          "plural": false,
          "selections": [
            (v1/*: any*/),
            (v2/*: any*/),
            {
              "alias": null,
              "args": null,
              "kind": "ScalarField",
              "name": "onlineStatus",
              "storageKey": null
            }
          ],
          "storageKey": null
        }
      ],
      "storageKey": null
    }
  ],
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": [
      (v0/*: any*/)
    ],
    "kind": "Fragment",
    "metadata": null,
    "name": "TestPreloadedQueryWithProvidedVariablesQuery",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "User",
        "kind": "LinkedField",
        "name": "loggedInUser",
        "plural": false,
        "selections": [
          {
            "args": null,
            "kind": "FragmentSpread",
            "name": "TestPreloadedQuery_user"
          }
        ],
        "storageKey": null
      },
      (v3/*: any*/)
    ],
    "type": "Query",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [
      (v0/*: any*/),
      {
        "defaultValue": null,
        "kind": "LocalArgument",
        "name": "__relay_internal__pv__TestProvidedVariablesSomeInput"
      },
      {
        "defaultValue": null,
        "kind": "LocalArgument",
        "name": "__relay_internal__pv__TestProvidedVariablesInputB"
      },
      {
        "defaultValue": null,
        "kind": "LocalArgument",
        "name": "__relay_internal__pv__TestProvidedVariablesBool"
      },
      {
        "defaultValue": null,
        "kind": "LocalArgument",
        "name": "__relay_internal__pv__TestProvidedVariablesStr"
      },
      {
        "defaultValue": null,
        "kind": "LocalArgument",
        "name": "__relay_internal__pv__TestProvidedVariablesFloat"
      },
      {
        "defaultValue": null,
        "kind": "LocalArgument",
        "name": "__relay_internal__pv__TestProvidedVariablesInt"
      },
      {
        "defaultValue": null,
        "kind": "LocalArgument",
        "name": "__relay_internal__pv__TestProvidedVariablesID"
      },
      {
        "defaultValue": null,
        "kind": "LocalArgument",
        "name": "__relay_internal__pv__TestProvidedVariablesDatetime"
      },
      {
        "defaultValue": null,
        "kind": "LocalArgument",
        "name": "__relay_internal__pv__TestProvidedVariablesDatetimes"
      }
    ],
    "kind": "Operation",
    "name": "TestPreloadedQueryWithProvidedVariablesQuery",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "User",
        "kind": "LinkedField",
        "name": "loggedInUser",
        "plural": false,
        "selections": [
          (v2/*: any*/),
          {
            "alias": null,
            "args": [
              {
                "kind": "Variable",
                "name": "bool",
                "variableName": "__relay_internal__pv__TestProvidedVariablesBool"
              },
              {
                "kind": "Variable",
                "name": "dateTime",
                "variableName": "__relay_internal__pv__TestProvidedVariablesDatetime"
              },
              {
                "kind": "Variable",
                "name": "dateTimes",
                "variableName": "__relay_internal__pv__TestProvidedVariablesDatetimes"
              },
              {
                "kind": "Variable",
                "name": "float",
                "variableName": "__relay_internal__pv__TestProvidedVariablesFloat"
              },
              {
                "kind": "Variable",
                "name": "id",
                "variableName": "__relay_internal__pv__TestProvidedVariablesID"
              },
              {
                "kind": "Variable",
                "name": "inputB",
                "variableName": "__relay_internal__pv__TestProvidedVariablesInputB"
              },
              {
                "kind": "Variable",
                "name": "int",
                "variableName": "__relay_internal__pv__TestProvidedVariablesInt"
              },
              {
                "kind": "Variable",
                "name": "someInput",
                "variableName": "__relay_internal__pv__TestProvidedVariablesSomeInput"
              },
              {
                "kind": "Variable",
                "name": "str",
                "variableName": "__relay_internal__pv__TestProvidedVariablesStr"
              }
            ],
            "kind": "ScalarField",
            "name": "onlineStatus",
            "storageKey": null
          },
          (v1/*: any*/)
        ],
        "storageKey": null
      },
      (v3/*: any*/)
    ]
  },
  "params": {
    "id": "e2103af665a0e792e8f00f56ebb0c3e4",
    "metadata": {},
    "name": "TestPreloadedQueryWithProvidedVariablesQuery",
    "operationKind": "query",
    "text": null,
    "providedVariables": providedVariablesDefinition
  }
};
})()|json}]
]
let node: operationType = makeNode providedVariablesDefinition


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
}
type operationId
type operationTypeParams = {id: operationId}
external getOperationTypeParams: operationType -> operationTypeParams = "params" [@@mel.get]
external setPreloadQuery: operationId -> operationType -> unit = "set" [@@mel.module "relay-runtime"] [@@mel.scope "PreloadableQueryRegistry"]

 let () = (getOperationTypeParams node).id |> setPreloadQuery node
