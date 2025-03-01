import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final Dio dio;
  String? _authToken;

  ApiClient({required String baseUrl})
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10), // Connection timeout
          receiveTimeout: const Duration(seconds: 10), // Response timeout
          headers: {
            'Content-Type': 'application/json',
          },
        )) {
    _loadAuthToken();
  }

  /// Load token from SharedPreferences
  Future<void> _loadAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    _authToken = prefs.getString('auth_token');
    print("🔒 Auth Token Loaded from Local :${_authToken}");
    if (_authToken != null) {
      dio.options.headers["Authorization"] = "Bearer $_authToken";
    }
  }

  /// Set Token after login
  Future<void> setAuthToken(String token) async {
    _authToken = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
    dio.options.headers["Authorization"] = "Bearer $_authToken";
    _loadAuthToken();
  }

  /// Remove token (logout)
  Future<void> removeAuthToken() async {
    _authToken = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    dio.options.headers.remove("Authorization");
  }

  /// Generic request method
  Future<Response> request(String endpoint,
      {String method = "GET", Map<String, dynamic>? data}) async {
    try {
      Response response;
      if (method == "GET") {
        response = await dio.get(endpoint);
      } else if (method == "POST") {
        response = await dio.post(endpoint, data: data);
      } else if (method == "PUT") {
        response = await dio.put(endpoint, data: data);
      } else if (method == "DELETE") {
        response = await dio.delete(endpoint);
      } else {
        throw Exception("Unsupported HTTP method: $method");
      }
      return response;
    } on DioException catch (e) {
      throw e.response?.data ?? {"message": "Network error"};
    }
  }
}
