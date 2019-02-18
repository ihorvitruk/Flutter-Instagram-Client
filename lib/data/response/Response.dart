import 'package:flutter_instagram_client/domain/entity/Entity.dart';

abstract class Response<D> {
  D _data;
  Meta _meta;

  Response(Map<String, dynamic> json) {
    _data = fromDataJson(json["data"]);
    _meta = Meta.fromJson(json["meta"]);
  }

  D get data => _data;

  Meta get meta => _meta;

  D fromDataJson(Map<String, dynamic> json);
}

abstract class ListResponse<D extends Entity> {
  List<D> _data;
  Meta _meta;

  ListResponse(Map<String, dynamic> json) {
    _data = fromDataListJson(json["data"]);
    _meta = Meta.fromJson(json["meta"]);
  }

  List<D> get data => _data;

  Meta get meta => _meta;

  List<D> fromDataListJson(List<Map<String, dynamic>> jsonArray) {
    final result = List<D>();
    for (var jsonObj in jsonArray) {
      result.add(fromDataJson(jsonObj));
    }
    return result;
  }

  D fromDataJson(Map<String, dynamic> json);
}

class Meta {
  final code;
  final errorType;
  final errorMessage;

  Meta.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        errorType = json["error_type"],
        errorMessage = json["error_message"];
}
