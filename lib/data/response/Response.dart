import 'package:flutter_instagram_client/domain/entity/Entity.dart';

abstract class Response<E> {
  E _data;
  Meta _meta;

  Response(Map<String, dynamic> json) {
    _data = fromDataJson(json["data"]);
    _meta = Meta.fromJson(json["meta"]);
  }

  E get data => _data;

  Meta get meta => _meta;

  E fromDataJson(Map<String, dynamic> json);
}

abstract class ListResponse<E extends Entity> {
  List<E> _data;
  Meta _meta;

  ListResponse(Map<String, dynamic> json) {
    _data = fromDataListJson(json["data"]);
    _meta = Meta.fromJson(json["meta"]);
  }

  List<E> get data => _data;

  Meta get meta => _meta;

  List<E> fromDataListJson(List<dynamic> jsonArray) {
    final result = List<E>();
    for (var jsonObj in jsonArray) {
      result.add(fromDataJson(jsonObj));
    }
    return result;
  }

  E fromDataJson(Map<String, dynamic> json);
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
