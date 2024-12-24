import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learningapp/src/presentation/controllers/course_overview_controller.dart';

import 'widgets/couse_overview_body.dart';

class CourseOverview extends StatelessWidget {
  const CourseOverview({super.key});

  @override
  Widget build(BuildContext context) {
    CourseOverviewController courseOverviewController =
        Get.put(CourseOverviewController());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CouseOverviewBody(),
    );
  }
}