// To parse this JSON data, do
//
//     final coachingslot = coachingslotFromJson(jsonString);

import 'dart:convert';

List<Coachingslot> coachingslotFromJson(String str) => List<Coachingslot>.from(json.decode(str).map((x) => Coachingslot.fromJson(x)));

String coachingslotToJson(List<Coachingslot> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coachingslot {
    Coachingslot({
        this.id,
        this.title,
        this.description,
        this.timeFrom,
        this.timeTo,
        this.sort,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String title;
    String description;
    String timeFrom;
    String timeTo;
    int sort;
    DateTime createdAt;
    DateTime updatedAt;

    factory Coachingslot.fromJson(Map<String, dynamic> json) => Coachingslot(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        timeFrom: json["time_from"],
        timeTo: json["time_to"],
        sort: json["sort"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "time_from": timeFrom,
        "time_to": timeTo,
        "sort": sort,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
