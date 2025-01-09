import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/colors.dart';

class FeaturedCoursesHeader extends StatelessWidget {
  const FeaturedCoursesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Text(
          "Featured Courses",
          style: GoogleFonts.raleway(
            color: AppColors.featuredCoursesTitleColor,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
