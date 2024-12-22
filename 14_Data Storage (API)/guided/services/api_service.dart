import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  List<dynamic> posts = []; // Menyimpan data post yang diterima

  // Fungsi untuk GET data
  Future<void> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        posts = json.decode(response.body);
      } else {
        throw Exception(
            'Failed to load posts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during GET request: $e');
    }
  }

  // Fungsi untuk POST data
  Future<void> createPost() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'userId': 1,
        }),
      );
      if (response.statusCode == 201) {
        posts.add({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'id': posts.length + 1,
        });
      } else {
        throw Exception(
            'Failed to create post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during POST request: $e');
    }
  }

  // Fungsi untuk UPDATE data
  Future<void> updatePost() async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/posts/1'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Updated Title',
          'body': 'Updated Body',
          'userId': 1,
        }),
      );
      if (response.statusCode == 200) {
        final updatedPost =
            posts.firstWhere((post) => post['id'] == 1, orElse: () => null);
        if (updatedPost != null) {
          updatedPost['title'] = 'Updated Title';
          updatedPost['body'] = 'Updated Body';
        }
      } else {
        throw Exception(
            'Failed to update post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during PUT request: $e');
    }
  }

  // Fungsi untuk DELETE data
  Future<void> deletePost() async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/posts/1'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        posts.removeWhere((post) => post['id'] == 1);
      } else {
        throw Exception(
            'Failed to delete post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during DELETE request: $e');
    }
  }
}
