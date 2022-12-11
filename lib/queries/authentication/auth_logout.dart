import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> logout(CookieRequest request) async {
  final response =
      await request.logout('https://start-in.up.railway.app/auth/api/logout/');

  if (response['status']) {
    request.loggedIn = false;
    request.jsonData = {};
    
    var ref = await SharedPreferences.getInstance();
    ref.setString('username', "");
  
  } else {
    request.loggedIn = true;
  }

  request.cookies = {};
}
