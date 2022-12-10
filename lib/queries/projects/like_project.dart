import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/models/project.dart';

Future<Map> likeProject(CookieRequest request, int projectId) async {
  print(request.headers);
  final responseData = await request
      .post('https://start-in.up.railway.app/projects/like-project/', {
    'id': projectId.toString(),
  });

  print(responseData);

  Project project = Project.fromJson(responseData[0]);

  return {'like_count': project.likeCount, 'is_liked': project.isLiked};
}
