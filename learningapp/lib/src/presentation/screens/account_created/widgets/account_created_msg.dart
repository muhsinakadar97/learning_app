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
            fontSize: 22,
          ),
        ),
        Text(
          "Get started with the best learning experience",
          style: GoogleFonts.raleway(fontSize: 15),
        ),
        Text(
          "tailormade for you.",
          style: GoogleFonts.raleway(),
        ),
      ],
    );
  }
}
