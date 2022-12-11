import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/models/project.dart';

Future<Project> doneProject(CookieRequest request, int projectId) async {
  final responseData =
      await request.post('https://start-in.up.railway.app/projects/done/', {
    'id': projectId.toString(),
  });

  return Project.fromJson(responseData[0]);
}
