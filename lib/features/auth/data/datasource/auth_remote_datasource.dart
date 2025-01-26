import 'dart:convert'; // For JSON encoding/decoding
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

/// Abstract AuthRemoteDataSource
abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

/// Concrete implementation of AuthRemoteDataSource
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client; // Use the HTTP client for API calls
  final String baseUrl; // Base URL for the API

  AuthRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/signup'); // Replace with your API endpoint

    try {
      // Send the POST request
      final response = await client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      // Handle response
      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return UserModel.fromJson(responseData);
      } else {
        throw ServerException('Failed to sign up: ${response.body}');
      }
    } catch (e) {
      throw ServerException('Sign up error: $e');
    }
  }

  @override
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/login'); // Replace with your API endpoint

    try {
      // Send the POST request
      final response = await client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      // Handle response
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return UserModel.fromJson(responseData);
      } else {
        throw ServerException('Failed to log in: ${response.body}');
      }
    } catch (e) {
      throw ServerException('Login error: $e');
    }
  }
}
