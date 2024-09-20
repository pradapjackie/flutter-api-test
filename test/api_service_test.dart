import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:untitled1/api_service.dart';

void main() {
  group('ApiService', () {
    final apiService = ApiService('https://jsonplaceholder.typicode.com');

    test('GET request returns a successful response', () async {
      final response = await apiService.get('/posts/1');

      print('GET response: ${response.body}'); // Print JSON response to console

      expect(response.statusCode, 200);
      expect(response.body, contains('userId'));
    });

    test('POST request creates a new post', () async {
      final response = await apiService.post('/posts', {
        'title': 'foo',
        'body': 'bar',
        'userId': 1,
      });

      print('POST response: ${response.body}'); // Print JSON response to console

      expect(response.statusCode, 201);
      final responseBody = jsonDecode(response.body);
      expect(responseBody['title'], 'foo');
    });

    test('PATCH request updates an existing post', () async {
      final response = await apiService.patch('/posts/1', {
        'title': 'updated title',
      });

      print('PATCH response: ${response.body}'); // Print JSON response to console

      expect(response.statusCode, 200);
      final responseBody = jsonDecode(response.body);
      expect(responseBody['title'], 'updated title');
    });

    test('DELETE request removes a post', () async {
      final response = await apiService.delete('/posts/1');

      print('DELETE response: ${response.body}'); // Print JSON response to console

      expect(response.statusCode, 200);
      expect(response.body, isEmpty);
    });
  });
}
