import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/models/project.dart';

Future<bool> editProject(CookieRequest request, int projectId, String title,
    String description, int donationTarget) async {
  final responseData = await request.post(
      'https://start-in.up.railway.app/projects/api/edit-project/$projectId', {
    'title': title,
    'description': description,
    'donation_target': donationTarget.toString(),
  });

  return responseData['status'] == 'Success';
}
