import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<http.Response> get(String endpoint) {
    return http.get(Uri.parse('$baseUrl$endpoint'));
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> data) {
    return http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
  }

  Future<http.Response> patch(String endpoint, Map<String, dynamic> data) {
    return http.patch(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
  }

  Future<http.Response> delete(String endpoint) {
    return http.delete(Uri.parse('$baseUrl$endpoint'));
  }
}
