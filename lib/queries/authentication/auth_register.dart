import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/util/Register.dart';


Future<bool> register(
    CookieRequest request, RegisterPayload payload ) async {
      var response = await request.post('https://start-in.up.railway.app/auth/api/register/', {
    
      'username' : payload.username,
      'name' : payload.name,
      'birth_date' : payload.birth_date,
      'password1' : payload.password1,
      'password2' : payload.password2,
      'job' : payload.job,
      'description' : payload.description,

    
  });
  return response['status'];
}
