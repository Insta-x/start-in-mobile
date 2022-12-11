import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/models/project.dart';

Future<Project> fetchProject(CookieRequest request, int projectId) async {
  final responseData = await request
      .get('https://start-in.up.railway.app/projects/api/project/$projectId');

  return Project.fromJson(responseData);
}

Future<List<Project>> fetchProjects(
    CookieRequest request, String searchQuery) async {
  print(searchQuery);
  final responseData = await request.get(
      'https://start-in.up.railway.app/projects/get-projects/?search=$searchQuery');

  List<Project> projectList = [];

  for (var project in responseData) {
    if (project != null) {
      projectList.add(Project.fromJson(project));
    }
  }

  print(projectList);

  return projectList;
}

Future<List<Project>> fetchUserProjects(CookieRequest request) async {
  final responseData = await request
      .get('https://start-in.up.railway.app/projects/get-user-projects/');

  List<Project> projectList = [];

  for (var project in responseData) {
    if (project != null) {
      projectList.add(Project.fromJson(project));
    }
  }

  return projectList;
}
