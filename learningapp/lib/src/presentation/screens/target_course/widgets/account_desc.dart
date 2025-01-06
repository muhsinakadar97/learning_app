import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountDesc extends StatelessWidget {
  const AccountDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "What Course are you aiming for?",
            style:
                GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text("This will help us curate the best learning",
              style: GoogleFonts.raleway()),
          Text(
            "experience for you.",
            style: GoogleFonts.raleway(),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
