import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 10,
            height: 50,
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.close))),
        Expanded(
          child: Center(
            child: Column(
              children: [
                Text(
                  "Setup your account",
                  style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Target Course",
                  style: GoogleFonts.raleway(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
