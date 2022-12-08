// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
    Comment({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
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
        required this.forum,
        required this.fromUser,
        required this.username,
        required this.userJob,
        required this.timeCreated,
        required this.comment,
    });

    int forum;
    int fromUser;
    String username;
    String userJob;
    DateTime timeCreated;
    String comment;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        forum: json["forum"],
        fromUser: json["from_user"],
        username: json["username"],
        userJob: json["user_job"],
        timeCreated: DateTime.parse(json["time_created"]),
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "forum": forum,
        "from_user": fromUser,
        "username": username,
        "user_job": userJob,
        "time_created": "${timeCreated.year.toString().padLeft(4, '0')}-${timeCreated.month.toString().padLeft(2, '0')}-${timeCreated.day.toString().padLeft(2, '0')}",
        "comment": comment,
    };
}
