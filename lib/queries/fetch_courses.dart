import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/courses_data.dart';
import '../pages/courses/courses.dart';

class CoursesApi {
  static Future<List<AddedCourse>> getCourse() async {
    final url = Uri.parse("https://start-in.up.railway.app/courses/json");
    final response = await http.get(url);
    final body = json.decode(response.body);

    List<AddedCourse> dataCourse = [];

    for (var i in body) {
      if (i != null) {
        print(i);
        dataCourse.add(AddedCourse.fromJson(i));
      }
    }
    return dataCourse;
  }
}
