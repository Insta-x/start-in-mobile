import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:start_in_mobile/models/Forum.dart';

Future<List<Forum>> get_all_forum() async {
        var url = Uri.parse('https://start-in.up.railway.app/inforum/get_all_forum/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Forum
        List<Forum> forums = [];
        for (var d in data) {
        if (d != null) {
            forums.add(Forum.fromJson(d));
        }
        }

        return forums;
    }