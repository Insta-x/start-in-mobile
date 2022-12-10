
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';

Future<bool> login(
    CookieRequest request, String username, String password) async {
  print(request.cookies);
  final response =
      await request.login('https://start-in.up.railway.app/auth/api/login/', {
    'username': username,
    'password': password,
  });
  return request.loggedIn;
}
