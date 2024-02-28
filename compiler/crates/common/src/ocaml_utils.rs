use intern::string_key::{Intern, StringKey};


pub fn get_module_name_from_file_path(str: &str) -> String {
    match std::path::Path::new(str).file_stem().unwrap().to_str() {
        None => String::from(""),
        Some(str) => str.to_string(),
    }
}

pub fn get_load_fn_code() -> StringKey {
    "let (load :
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
".intern()
}

pub fn get_load_query_code(include_load_fn: bool) -> StringKey {
    format!("{}
type nonrec 'response rawPreloadToken =
  {{ source : 'response Melange_relay.Observable.t Js.Nullable.t }}

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
",
if include_load_fn {
  get_load_fn_code()
} else {
  "".intern()
}).intern()
}
