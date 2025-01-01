import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountCreatedMsg extends StatelessWidget {
  const AccountCreatedMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Account Created Successfully",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Text(
          "Get started with the best learning experience",
          style: GoogleFonts.raleway(),
        ),
        Text(
          "tailormade for you.",
          style: GoogleFonts.raleway(),
        ),
      ],
    );
  }
}
