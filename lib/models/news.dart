import 'dart:convert';

List<News> forumFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String forumToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class News {
//   News({
//     required this.model,
//     required this.pk,
//     required this.fields,
//   });

//   String model;
//   int pk;
//   Fields fields;

//   factory News.fromJson(Map<String, dynamic> json) => News(
//         model: json["model"],
//         pk: json["pk"],
//         fields: Fields.fromJson(json["fields"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "model": model,
//         "pk": pk,
//         "fields": fields.toJson(),
//       };
// }

class News {
  News({
    required this.title,
    required this.description,
    required this.url,
  });

  String title;
  String description;
  String url;

  factory News.fromJson(Map<String, dynamic> json) => News(
        title: json["title"],
        description: json["description"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "url": url,
      };
}