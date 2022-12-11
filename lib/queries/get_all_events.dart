import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:start_in_mobile/models/events.dart';

Future<List<Events>> get_all_events() async {
        var url = Uri.parse('https://start-in.up.railway.app/events/get_all_events/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object events
        List<Events> events = [];
        for (var d in data) {
        if (d != null) {
            events.add(Events.fromJson(d));
        }
        }

        return events;
    }