import 'package:flutter_instagram_client/domain/entity/Entity.dart';

abstract class Response<D extends Entity> {
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

class Meta {
  final int code;
  final String errorType;
  final String errorMessage;

  Meta.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        errorType = json["error_type"],
        errorMessage = json["error_message"];
}
