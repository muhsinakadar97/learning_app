import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/config/theme/colors.dart';

class ExploreButton extends StatelessWidget {
  const ExploreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: AppColors.indigoDark,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: AppColors.blueGrey,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Explore",
            style: GoogleFonts.raleway(
              color: AppColors.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
