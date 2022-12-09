import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<void> login(
    CookieRequest request, String username, String password) async {
  print(request.cookies);
  final response =
      await request.login('https://start-in.up.railway.app/auth/api/login/', {
    'username': username,
    'password': password,
  });

  if (request.loggedIn) {
    print('Login Success');
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const HomePage()),
    // );
  } else {
    print('Login Failed');
  }
}
