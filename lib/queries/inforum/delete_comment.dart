import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';

Future<void> deleteComment(
    CookieRequest request, int forum_id, int comment_id) async {
  final response =
      await request.post('https://start-in.up.railway.app/inforum/forum/${forum_id}/comment/delete/${comment_id}', {
        
  });
  
}
