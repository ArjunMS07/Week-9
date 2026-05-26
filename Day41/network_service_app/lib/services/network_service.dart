import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<void> fetchTasks() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/todos',
        ),
      );

      print("=================================");
      print("Status Code: ${response.statusCode}");
      print("=================================");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print("Raw JSON Data:");
        print(data);
      } else {
        print("Failed to fetch tasks");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}