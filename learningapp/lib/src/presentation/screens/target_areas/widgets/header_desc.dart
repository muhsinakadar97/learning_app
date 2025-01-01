import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderDesc extends StatelessWidget {
  const HeaderDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "What are your weeknesses and",
            style:
                GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            "strengths?",
            style:
                GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text("This will help us curate the best learning",
              style: GoogleFonts.raleway()),
          Text(
            "experience for you.",
            style: GoogleFonts.raleway(),
          )
          // Center(
          //   child: Text(
          //     "What are your weeknesses and strengths?",
          // style: GoogleFonts.raleway(
          //     fontWeight: FontWeight.bold, fontSize: 25),
          //   ),
          // ),
          // Text("This will help us curate the best learning",
          //     style: GoogleFonts.raleway()),
          // Text(
          //   "experience for you.",
          //   style: GoogleFonts.raleway(),
          // )
        ],
      ),
    );
  }
}
