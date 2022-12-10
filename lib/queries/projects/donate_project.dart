import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/models/project.dart';

Future<void> donateProject(
    CookieRequest request, int projectId, int amount) async {
  print(request.headers);
  final responseData =
      await request.post('https://start-in.up.railway.app/projects/donate/', {
    'project': projectId.toString(),
    'amount': amount.toString(),
  });

  print(responseData);
}
