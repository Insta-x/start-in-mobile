
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> login(
    CookieRequest request, String username, String password) async {
      await request.login('https://start-in.up.railway.app/auth/api/login/', {
    'username': username,
    'password': password,
  });

  if(request.loggedIn){
    var ref = await SharedPreferences.getInstance();
    ref.setString('username', username);
  }
  return request.loggedIn;
}
