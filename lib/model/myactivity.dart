// To parse this JSON data, do
//
//     final myActivity = myActivityFromJson(jsonString);

import 'dart:convert';

List<MyActivity> myActivityFromJson(String str) => List<MyActivity>.from(json.decode(str).map((x) => MyActivity.fromJson(x)));

String myActivityToJson(List<MyActivity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyActivity {
    MyActivity({
        this.id,
        this.name,
        this.description,
        this.video,
        this.sort,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String description;
    String video;
    int sort;
    DateTime createdAt;
    DateTime updatedAt;

    factory MyActivity.fromJson(Map<String, dynamic> json) => MyActivity(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        video: json["video"],
        sort: json["sort"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "video": video,
        "sort": sort,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
