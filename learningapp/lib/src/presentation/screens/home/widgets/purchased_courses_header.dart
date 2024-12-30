import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PurchasedCoursesHeader extends StatelessWidget {
  const PurchasedCoursesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text(
            "Purchased Courses",
            style: GoogleFonts.raleway(
              color: Colors.indigo[900],
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
