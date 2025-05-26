import 'dart:convert';

class DynamicResponse {
  bool? status;
  String? message;
  dynamic data;

  DynamicResponse({this.status, this.message, this.data});

  factory DynamicResponse.fromJson(Map<String, dynamic> json) =>
      DynamicResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}

DynamicResponse dynamicResponseFromJson(String str) =>
    DynamicResponse.fromJson(json.decode(str));

String dynamicResponseToJson(DynamicResponse data) =>
    json.encode(data.toJson());
