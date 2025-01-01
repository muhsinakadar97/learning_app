import 'package:flutter/material.dart';

import 'course_listtile.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const CourseListTile();
          }),
    );
  }
}
