import 'package:flutter/material.dart';

class CourseListPage extends StatelessWidget {
  final int? courseId;
  const CourseListPage({Key? key, this.courseId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course List'),
      ),
      body: Center(
        child: Text(
          'Course Id Nomor : $courseId',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
