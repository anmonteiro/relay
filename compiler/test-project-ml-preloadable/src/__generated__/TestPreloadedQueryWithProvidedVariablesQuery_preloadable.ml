(* @sourceLoc Test_preloadedQuery.re *)
(* @generated *)
[%%mel.raw "/* @generated */"]
type queryRef = TestPreloadedQueryWithProvidedVariablesQuery_graphql.queryRef
module Types = struct
  [@@@ocaml.warning "-30"]

  type someInput = RelaySchemaAssets_graphql.input_SomeInput
  type inputB = RelaySchemaAssets_graphql.input_InputB
  type inputA = RelaySchemaAssets_graphql.input_InputA
  type variables = {
    status: [
      | `Idle
      | `Offline
      | `Online
    ] option;
  }
end

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
  end
module Utils = struct
  [@@@ocaml.warning "-33"]
  open Types
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
type operationType = RescriptRelay.queryNode<relayOperationNode>


[%%private let makeNode providedVariablesDefinition: operationType = 
  ignore providedVariablesDefinition;
  [%raw {json|{
  "kind": "PreloadableConcreteRequest",
  "params": {
    "id": "e2103af665a0e792e8f00f56ebb0c3e4",
    "metadata": {},
    "name": "TestPreloadedQueryWithProvidedVariablesQuery",
    "operationKind": "query",
    "text": null,
    "providedVariables": providedVariablesDefinition
  }
}|json}]
]
let node: operationType = makeNode providedVariablesDefinition

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

