import 'dart:convert';

import 'package:chatapp/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final String baseURl = 'http://localhost:6000/auth';

  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await http.post(Uri.parse("$baseURl/login"),
        body: jsonEncode(
          {'email': email, 'password': password},
        ),
        headers: {'Content-type': 'application/json'});
    return UserModel.fromJson(jsonDecode(response.body));
  }

  Future<UserModel> register(
      {required String username,
      required String email,
      required String password}) async {
    final response = await http.post(Uri.parse("$baseURl/register"),
        body: jsonEncode(
          {'username': username, 'email': email, 'password': password},
        ),
        headers: {'Content-type': 'application/json'});
    print(response.body);
    return UserModel.fromJson(jsonDecode(response.body)["user"]);
  }
}
