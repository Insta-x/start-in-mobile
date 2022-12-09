import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<void> logout(CookieRequest request) async {
  print(request.headers);

  final response =
      await request.get('https://start-in.up.railway.app/auth/api/logout/');

  print(response);

  if (response['status']) {
    request.loggedIn = false;
    request.jsonData = {};
  } else {
    request.loggedIn = true;
  }

  request.cookies = {};
}
