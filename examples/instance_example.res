/* Creating an instance */
open Axios

let inst = Instance.create(makeConfig(~baseURL="https://example.com", ()))
open Js.Promise
Instance.get(inst, "/") |> then_(resp => resolve(Js.log(resp["data"]))) |> ignore
