import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/controllers/otp_controller.dart';

class OtpTextfield extends StatelessWidget {
  final int index;

  // Constructor to accept the index
  const OtpTextfield({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // Get the instance of OtpController
    OtpController otpController = Get.put(OtpController());

    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: SizedBox(
        width: 40,
        height: 40,
        child: TextField(
          cursorColor: Colors.blueGrey[900],
          controller: otpController.controllers[index],
          focusNode: otpController.focusNodes[index],
          maxLength: 1,
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF263238), width: 2.0),
            ),
            counterText: '', // Hide the character counter
          ),
          // Call onTextChanged when text changes
          onChanged: (value) => otpController.onTextChanged(value, index),
        ),
      ),
    );
  }
}
