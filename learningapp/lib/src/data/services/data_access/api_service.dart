import 'package:http/http.dart' as http;

class ApiService {
  ApiService();

  Future<http.Response> get({required String url}) async {
    try {
      final response = await http.get(Uri.parse(url));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
