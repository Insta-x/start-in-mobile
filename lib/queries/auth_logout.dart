import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<void> logout(CookieRequest request) async {
  final response =
      await request.logout('https://start-in.up.railway.app/auth/api/logout/');

  if (response['status']) {
    request.loggedIn = false;
    request.jsonData = {};
  } else {
    request.loggedIn = true;
  }

  request.cookies = {};
}