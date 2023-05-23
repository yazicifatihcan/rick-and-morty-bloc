enum HttpMethod { get, post, put, delete, update}

enum AppEnvironment {
  Development,
  Production,
}


enum BaseModelStatus { Ok, Error, Action, UnprocessableEntity, TimeOut, NotFound, Found }