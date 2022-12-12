

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:start_in_mobile/models/Comment.dart';

Future<List<Comment>> get_all_comment(int forum_id) async {
      print(forum_id);
        var url = Uri.parse('https://start-in.up.railway.app/inforum/forum/comment/${forum_id}');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Comment
        List<Comment> forums = [];
        for (var d in data) {
        if (d != null) {
            forums.add(Comment.fromJson(d));
        }
        }

        return forums;
    }