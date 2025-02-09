type configWithUrl = {"url": string}

type config = {.}

type requestTransformer<'data, 'headers, 'resultData>

type responseTransformer<'data, 'resultData>

type paramsSerializer<'a> = 'a => string

type response<'data, 'header> = {
  "data": 'data,
  "status": int,
  "statusText": string,
  "headers": 'header,
  "config": config,
}

type adapter<'a, 'b> = config => Js.Promise.t<response<'a, 'b>>

type auth = {"username": string, "password": string}

type proxy = {"host": int, "port": int, "auth": auth}

type onProgress<'a> = 'a => unit

type validateStatus = int => bool
