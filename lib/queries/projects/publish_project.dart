import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/models/project.dart';

Future<Project> publishProject(CookieRequest request, int projectId) async {
  print(request.headers);
  final responseData =
      await request.post('https://start-in.up.railway.app/projects/publish/', {
    'id': projectId.toString(),
  });

  return Project.fromJson(responseData[0]);
}
