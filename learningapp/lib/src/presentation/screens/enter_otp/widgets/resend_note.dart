import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResendNote extends StatelessWidget {
  const ResendNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 40),
      child: Column(
        children: [
          Text(
            "Code not recieved?",
            style: GoogleFonts.raleway(fontSize: 17),
          ),
          Text(
            "Resend Now",
            style: GoogleFonts.raleway(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ],
      ),
    );
  }
}
