import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/user.dart';

import '../../domain/repository/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final http.Client client;

  AuthRepositoryImpl(this.client);

  @override
  Future<User> login(String email, String password) async {
    final response = await client.post(
      Uri.parse('https://example.com/api/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Login failed');
    }
  }

  @override
  Future<User> signup(String name, String email, String password) async {
    final response = await client.post(
      Uri.parse('https://example.com/api/signup'),
      body: {'name': name, 'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Signup failed');
    }
  }
}

