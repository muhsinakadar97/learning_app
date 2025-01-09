import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PolicyNote extends StatelessWidget {
  const PolicyNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      const TextSpan(
          text: "By tapping 'Continue' your agree to our\n",
          children: <InlineSpan>[
            TextSpan(
              text: 'terms of service ',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            TextSpan(text: 'and '),
            TextSpan(
              text: 'privacy policy',
              style: TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold),
            ),
          ]),
      style: GoogleFonts.raleway(),
    );
  }
}
