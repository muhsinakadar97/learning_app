import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/screens/target_areas/target_areas.dart';

class EnterOtpContinueButton extends StatelessWidget {
  const EnterOtpContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: GestureDetector(
        onTap: () {
          log("Submitted");
          Get.to(const TargetAreas());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              "Continue",
              style: GoogleFonts.raleway(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}