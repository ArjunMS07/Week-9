
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/task_model.dart';

class NetworkService {

  Future<List<TaskModel>> fetchTasks() async {

    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/todos',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return (data as List)
          .map((task) => TaskModel.fromJson(task))
          .toList();

    } else {

      throw Exception("Failed to load tasks");
    }
  }
}