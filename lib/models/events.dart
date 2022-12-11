import 'dart:convert';

List<Events> forumFromJson(String str) =>
    List<Events>.from(json.decode(str).map((x) => Events.fromJson(x)));

String forumToJson(List<Events> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Events {
  Events({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
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
    required this.user,
    required this.event_type,
    required this.event_title,
    required this.description,
    required this.schedule,
    required this.location,
  });

  int user;
  String event_type;
  String event_title;
  String description;
  String schedule;
  String location;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        event_type: json["event_type"],
        event_title: json["event_title"],
        description: json["description"],
        schedule: json["schedule"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "event_type": event_type,
        "event_title": event_title,
        "description": description,
        "schedule": schedule,
        "location": location,
      };
}
