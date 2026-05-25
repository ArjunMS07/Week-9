import 'package:flutter/material.dart';
import '../controllers/course_controller.dart';

class CourseListView extends StatelessWidget {
  CourseListView({super.key});

  final CourseController controller = CourseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Course List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: controller.courses.length,
        itemBuilder: (context, index) {
          final course = controller.courses[index];

          return Card(
            color: Colors.deepPurple.shade50,
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                course.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(course.price),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.deepPurple,
              ),
              onTap: () {
                controller.openCourseDetails(
                  context,
                  course,
                );
              },
            ),
          );
        },
      ),
    );
  }
}