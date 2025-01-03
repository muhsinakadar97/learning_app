import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneTextfield extends StatelessWidget {
  const PhoneTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blueGrey[900],
      decoration: InputDecoration(
        hintText: "Your Phone Number",
        hintStyle: GoogleFonts.raleway(color: Colors.blueGrey[300]),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Icon(
            Icons.phone_outlined,
            size: 15,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF263238), width: 2.0),
        ),
      ),
    );
  }
}
