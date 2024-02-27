(* @sourceLoc Test_queryInputObj.ml *)
(* @generated *)
[%%mel.raw "/* @generated */"]
module Types = struct
  [@@@ocaml.warning "-30"]

  type pesticideListSearchInput = RelaySchemaAssets_graphql.input_PesticideListSearchInput
  type response = {
    searchPesticie: string option;
  }
  type rawResponse = response
  type variables = {
    input: pesticideListSearchInput;
  }
  type refetchVariables = {
    input: pesticideListSearchInput option;
  }
  let makeRefetchVariables 
    ?input 
    ()
  : refetchVariables = {
    input= input
  }

end


type queryRef

module Internal = struct
  let variablesConverter: string Js.Dict.t Js.Dict.t Js.Dict.t = [%mel.raw 
    {json|{"pesticideListSearchInput":{},"__root":{"input":{"r":"pesticideListSearchInput"}}}|json}
  ]
  let variablesConverterMap = ()
  let convertVariables v = Melange_relay.convertObj v 
    variablesConverter 
    variablesConverterMap 
    Js.undefined
    type wrapResponseRaw
  let wrapResponseConverter: string Js.Dict.t Js.Dict.t Js.Dict.t = [%mel.raw 
    {json|{}|json}
  ]
  let wrapResponseConverterMap = ()
  let convertWrapResponse v = Melange_relay.convertObj v 
    wrapResponseConverter 
    wrapResponseConverterMap 
    Js.null
    type responseRaw
  let responseConverter: string Js.Dict.t Js.Dict.t Js.Dict.t = [%mel.raw 
    {json|{}|json}
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
  external make_pesticideListSearchInput:     ?companyName: string array-> 
    ?pesticideIds: int array-> 
    skip: int-> 
    take: int-> 
    unit ->
   pesticideListSearchInput = "" [@@mel.obj]


  external makeVariables:     input: pesticideListSearchInput-> 
   variables = "" [@@mel.obj]


end

type relayOperationNode
type operationType = relayOperationNode Melange_relay.queryNode


let node: operationType = [%mel.raw {json| (function(){
var v0 = [
  {
    "defaultValue": null,
    "kind": "LocalArgument",
    "name": "input"
  }
],
v1 = [
  {
    "alias": null,
    "args": [
      {
        "kind": "Variable",
        "name": "input",
        "variableName": "input"
      }
    ],
    "kind": "ScalarField",
    "name": "searchPesticie",
    "storageKey": null
  }
];
return {
  "fragment": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Fragment",
    "metadata": null,
    "name": "TestQueryInputObjQuery",
    "selections": (v1/*: any*/),
    "type": "Query",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": (v0/*: any*/),
    "kind": "Operation",
    "name": "TestQueryInputObjQuery",
    "selections": (v1/*: any*/)
  },
  "params": {
    "cacheID": "379a28ab73fa483cd9cae404baa28064",
    "id": null,
    "metadata": {},
    "name": "TestQueryInputObjQuery",
    "operationKind": "query",
    "text": "query TestQueryInputObjQuery(\n  $input: PesticideListSearchInput!\n) {\n  searchPesticie(input: $input)\n}\n"
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

