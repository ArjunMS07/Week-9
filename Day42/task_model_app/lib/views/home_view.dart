import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../services/network_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final NetworkService service = NetworkService();

  List<TaskModel> tasks = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {

    final data = await service.fetchTasks();

    setState(() {
      tasks = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Task List"),
      ),

      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )

          : ListView.builder(

              itemCount: tasks.length,

              itemBuilder: (context, index) {

                final task = tasks[index];

                return Card(

                  margin: const EdgeInsets.all(10),

                  child: ListTile(

                    leading: CircleAvatar(
                      child: Text(task.id.toString()),
                    ),

                    title: Text(task.title),

                    subtitle: Text(
                      task.completed
                          ? "Completed"
                          : "Pending",
                    ),

                    trailing: Icon(
                      task.completed
                          ? Icons.check_circle
                          : Icons.pending,
                    ),
                  ),
                );
              },
            ),
    );
  }
}