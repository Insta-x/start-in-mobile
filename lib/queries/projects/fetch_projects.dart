import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/models/project.dart';

Future<List<Project>> fetchProjects(
    CookieRequest request, String searchQuery) async {
  print(request.headers);
  final responseData = await request.get(
      'https://start-in.up.railway.app/projects/get-projects/?search=$searchQuery');

  List<Project> projectList = [];

  for (var project in responseData) {
    if (project != null) {
      projectList.add(Project.fromJson(project));
      print(project['fields']['is_liked']);
    }
  }

  return projectList;
}

Future<List<Project>> fetchUserProjects(CookieRequest request) async {
  print(request.headers);
  final responseData = await request
      .get('https://start-in.up.railway.app/projects/get-user-projects/');

  List<Project> projectList = [];

  for (var project in responseData) {
    if (project != null) {
      projectList.add(Project.fromJson(project));
      print(project['fields']['is_liked']);
    }
  }

  return projectList;
}
