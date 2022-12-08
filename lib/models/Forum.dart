// To parse this JSON data, do
//
//     final forum = forumFromJson(jsonString);

import 'dart:convert';

List<Forum> forumFromJson(String str) => List<Forum>.from(json.decode(str).map((x) => Forum.fromJson(x)));

String forumToJson(List<Forum> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Forum {
    Forum({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Forum.fromJson(Map<String, dynamic> json) => Forum(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.userId,
        required this.username,
        required this.timeCreated,
        required this.title,
        required this.content,
        required this.category,
    });

    int userId;
    String username;
    DateTime timeCreated;
    String title;
    String content;
    String category;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        userId: json["user_id"],
        username: json["username"],
        timeCreated: DateTime.parse(json["time_created"]),
        title: json["title"],
        content: json["content"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "time_created": "${timeCreated.year.toString().padLeft(4, '0')}-${timeCreated.month.toString().padLeft(2, '0')}-${timeCreated.day.toString().padLeft(2, '0')}",
        "title": title,
        "content": content,
        "category": category,
    };
}
