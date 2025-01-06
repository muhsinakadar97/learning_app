import 'dart:convert';

import 'package:http/http.dart' as http;

class TodoRemoteDataSource {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Map<String, dynamic>>> fetchTodos() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
