import 'dart:convert';
import 'dart:convert' as convert;

import 'package:userlogin/Views/model/postModel.dart';

import '../model/model.dart';
import 'package:http/http.dart' as http;

class UserController {
  Future<UserModel> login({
    required String phone,
    required String password,
  }) async {
    final response = await http.get(
      Uri.parse("http://127.0.0.1:8000/api/user"),
    );

    if (response.statusCode == 200) {
      var jDecode = convert.jsonDecode(response.body);
      var xx = UserModel.fromJson(jDecode);
      print(xx);
      return UserModel.fromJson(jDecode);
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<UserPostModel> createAccout({
    required String email,
    required String username,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse("http://127.0.0.1:8000/api/register?"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var jDecode = convert.jsonDecode(response.body);
      var xx = UserPostModel.fromJson(jDecode);
      print(jDecode);
      return UserPostModel.fromJson(jDecode);
    } else {
      throw Exception('Something went wrong');
    }
  }
}
