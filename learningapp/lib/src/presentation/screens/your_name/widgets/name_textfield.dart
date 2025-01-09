import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameTextfield extends StatelessWidget {
  const NameTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blueGrey[900],
      decoration: InputDecoration(
        hintText: "Your Name",
        hintStyle: GoogleFonts.raleway(color: Colors.blueGrey[300]),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Image.asset(
            'assets/images/contact.png',
            height: 15,
            scale: 2,
            width: 15,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF263238), width: 2.0),
        ),
      ),
    );
  }
}
