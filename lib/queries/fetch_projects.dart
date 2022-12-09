import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:start_in_mobile/models/project.dart';

Future<List<Project>> fetchProjects(String searchQuery) async {
  final response = await http.get(
    Uri.parse(
        'https://start-in.up.railway.app/projects/get-projects/?search=$searchQuery'),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
      'Accept': '*/*'
    },
  );

  var responseData = jsonDecode(response.body);

  List<Project> projectList = [];

  for (var project in responseData) {
    if (project != null) {
      projectList.add(Project.fromJson(project['fields']));
    }
  }

  return projectList;
}
