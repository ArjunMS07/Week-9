import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../views/course_detail_view.dart';

class CourseController {

  final List<CourseModel> courses = [

    CourseModel(
      title: "Flutter Development",
      description: "Build Android & iOS apps.",
      price: "₹999",
    ),

    CourseModel(
      title: "Python Programming",
      description: "Learn Python from basics.",
      price: "₹799",
    ),

    CourseModel(
      title: "AI & Machine Learning",
      description: "Introduction to AI concepts.",
      price: "₹1499",
    ),
  ];

  void openCourseDetails(
    BuildContext context,
    CourseModel course,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            CourseDetailView(course: course),
      ),
    );
  }
}