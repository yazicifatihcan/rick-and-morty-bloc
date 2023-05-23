import 'dart:convert';

abstract class IBaseModel<T> {
  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();

  dynamic jsonParser(String jsonBody) {
    assert(T.toString() != 'dynamic');

    final _json = json.decode(jsonBody);
    if (_json is List) {
      return _json.map((e) => fromJson(e)).toList().cast<T>();
    } else if (_json is Map<String, dynamic>) {
      return fromJson(_json);
    } else {
      return _json;
    }
  }


  String convertToJson([dynamic model]) {
    if (model == null) {
      return json.encode(toJson());
    }

    assert(model is T || model is List<T>);

    if (model is List) {
      final list = List.from(model.map((e) => e?.toJson()));
      return json.encode(list);
    } else {
      return json.encode(model.toJson());
    }
  }
}
