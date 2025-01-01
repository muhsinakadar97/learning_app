import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'subject_item.dart';

class Strengths extends StatelessWidget {
  const Strengths({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 280,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 20),
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                "Strengths",
                style: GoogleFonts.raleway(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Column(
          children: [SubjectItem(), SubjectItem(), SubjectItem()],
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
