// To parse this JSON data, do
//
//     final loginerror = loginerrorFromJson(jsonString);

import 'dart:convert';

Loginerror loginerrorFromJson(String str) => Loginerror.fromJson(json.decode(str));

String loginerrorToJson(Loginerror data) => json.encode(data.toJson());

class Loginerror {
    Loginerror({
        this.error,
    });

    String error;

    factory Loginerror.fromJson(Map<String, dynamic> json) => Loginerror(
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
    };
}
