import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  final String apiUrl;

  DataService({required this.apiUrl});

  Future<List<dynamic>> fetchData() async {
    final url = Uri.parse(apiUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return [data];
    } else {
      // Handle errors
      throw Exception('Failed to load data');
    }
  }
}
