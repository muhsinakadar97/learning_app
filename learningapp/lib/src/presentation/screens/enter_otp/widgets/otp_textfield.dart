import 'package:flutter/material.dart';

class OtpTextfield extends StatelessWidget {
  const OtpTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: SizedBox(
        width: 40,
        height: 40,
        // color: Colors.amber,
        child: TextField(
          cursorColor: Colors.blueGrey[900],
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF263238), width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
