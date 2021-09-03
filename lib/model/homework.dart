// To parse this JSON data, do
//
//     final homework = homeworkFromJson(jsonString);

import 'dart:convert';

List<Homework> homeworkFromJson(String str) => List<Homework>.from(json.decode(str).map((x) => Homework.fromJson(x)));

String homeworkToJson(List<Homework> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Homework {
    Homework({
        this.id,
        this.name,
        this.description,
        this.file,
        this.sort,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String description;
    String file;
    int sort;
    DateTime createdAt;
    DateTime updatedAt;

    factory Homework.fromJson(Map<String, dynamic> json) => Homework(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        file: json["file"],
        sort: json["sort"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "file": file,
        "sort": sort,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
