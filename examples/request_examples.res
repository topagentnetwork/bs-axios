/* Simple request */
{
  open Js.Promise
  Axios.get("/user?ID=12345")
  |> then_(response => resolve(Js.log(response["data"])))
  |> catch(error => resolve(Js.log(error)))
  |> ignore
}

/* Post requests */
{
  open Js.Promise
  Axios.post("/user")
  |> then_(response => resolve(Js.log(response["data"])))
  |> catch(error => resolve(Js.log(error)))
}

let user = {"username": "michel", "password": "12345678"}

{
  open Js.Promise
  Axios.postData("/auth", user)
  |> then_(response => resolve(Js.log(response["data"])))
  |> catch(error => resolve(Js.log(error)))
}

/* Concurrency */
{
  open Js.Promise
  Axios.all2((Axios.get("/users/1"), Axios.get("/users/1/friends")))
  |> then_(((user, friends)) => resolve(Js.log2(user["data"], friends["data"])))
  |> catch(error => resolve(Js.log(error)))
}

/* Headers */
let headers = Axios.Headers.fromObj({"Content-type": "application/json"})
Axios.getc("https://example.com", Axios.makeConfig(~headers, ()))

let headersDict = {
  open Js.Dict

  let dict = empty()
  dict->set("Content-type", "application/json")
  dict
}
let headers = Axios.Headers.fromDict(headersDict)
Axios.getc("https://example.com", Axios.makeConfig(~headers, ()))

/* Node.js Agent */
let httpsAgent = {
  open Axios.Agent.Https
  config(~rejectUnauthorized=false, ()) |> create
}

Axios.getc("https://insecure-example.com", Axios.makeConfig(~httpsAgent, ()))
