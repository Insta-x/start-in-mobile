import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<bool> deleteProject(CookieRequest request, int projectId) async {
  print(request.headers);
  final responseData =
      await request.post('https://start-in.up.railway.app/projects/delete/', {
    'id': projectId.toString(),
  });

  return true;
}
