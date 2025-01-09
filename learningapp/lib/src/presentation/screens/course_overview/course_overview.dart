import 'package:flutter/material.dart';

import '../../../config/theme/colors.dart';
import 'widgets/couse_overview_body.dart';

class CourseOverview extends StatelessWidget {
  const CourseOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // CourseOverviewController courseOverviewController =
    //     Get.put(CourseOverviewController());
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: CouseOverviewBody(),
    );
  }
}
