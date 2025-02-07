// core/network/api_client.dart
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetxService {
  final String baseUrl;
  late http.Client client;
  String? _authToken;

  ApiClient({required this.baseUrl}) {
    client = http.Client();
  }

  /// Load token from SharedPreferences
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _authToken = prefs.getString('auth_token'); // Load token from storage
  }

  /// Set Token after login
  void setAuthToken(String token) async {
    _authToken = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  /// Remove token (logout)
  void removeAuthToken() async {
    _authToken = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  /// Custom **GET** request
  Future<dynamic> get(String endpoint) async {
    return _request('GET', endpoint);
  }

  /// Custom **POST** request
  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    return _request('POST', endpoint, body: body);
  }

  /// Custom **PUT** request
  Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    return _request('PUT', endpoint, body: body);
  }

  /// Custom **DELETE** request
  Future<dynamic> delete(String endpoint) async {
    return _request('DELETE', endpoint);
  }

  /// Core request handler
  Future<dynamic> _request(String method, String endpoint, {Map<String, dynamic>? body}) async {
    Uri url = Uri.parse('$baseUrl$endpoint');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      if (_authToken != null) 'Authorization': 'Bearer $_authToken',
    };

    http.Response response;

    try {
      if (method == 'GET') {
        response = await client.get(url, headers: headers);
      } else if (method == 'POST') {
        response = await client.post(url, headers: headers, body: jsonEncode(body));
      } else if (method == 'PUT') {
        response = await client.put(url, headers: headers, body: jsonEncode(body));
      } else if (method == 'DELETE') {
        response = await client.delete(url, headers: headers);
      } else {
        throw Exception('Unsupported HTTP method: $method');
      }

      return _handleResponse(response);

    } catch (e) {
      Get.snackbar("Network Error", e.toString());
      return null;
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      Get.snackbar("Unauthorized", "Please login again.");
      removeAuthToken(); // Clear token on unauthorized
    } else {
      throw Exception("Error ${response.statusCode}: ${response.body}");
    }
  }
}
