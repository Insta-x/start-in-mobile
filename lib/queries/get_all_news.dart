import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:start_in_mobile/models/news.dart';

Future<List<News>> get_all_news() async {
  var url = Uri.parse('https://start-in.up.railway.app/news/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object News
  List<News> news = [];
  for (var d in data) {
    if (d != null) {
      news.add(News.fromJson(d));
    }
  }
  return news;
}
