(* @sourceLoc Test_preloadedQuery.re *)
(* @generated *)
[%%mel.raw "/* @generated */"]
type queryRef = TestPreloadedQuery_graphql.queryRef
module Types = struct
  [@@@ocaml.warning "-30"]

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
    {json|{}|json}
  ]
  let variablesConverterMap = ()
  let convertVariables v = Melange_relay.convertObj v 
    variablesConverter 
    variablesConverterMap 
    Js.undefined
  end
module Utils = struct
  [@@@ocaml.warning "-33"]
  open Types
  external makeVariables:     ?status: [
      | `Idle
      | `Offline
      | `Online
    ]-> 
    unit ->
   variables = "" [@@mel.obj]


end

type relayOperationNode
type operationType = RescriptRelay.queryNode<relayOperationNode>


let node: operationType = [%mel.raw {json| {
  "kind": "PreloadableConcreteRequest",
  "params": {
    "id": "64e1bd5c44a860103e5980b544f5e454",
    "metadata": {},
    "name": "TestPreloadedQuery",
    "operationKind": "query",
    "text": null
  }
} |json}]

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

