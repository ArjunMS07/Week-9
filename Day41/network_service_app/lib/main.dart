import 'package:flutter/material.dart';
import 'services/network_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Fetch tasks from API
  await NetworkService().fetchTasks();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day 41 Networking',

      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Networking with HTTP',
          ),
          centerTitle: true,
        ),

        body: const Center(
          child: Text(
            'Check Console Output',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}