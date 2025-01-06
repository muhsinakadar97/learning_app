import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/screens/account_setup/account_setup.dart';
import 'package:learningapp/src/presentation/screens/target_course/target_course.dart';

class AccountCreatedContinueButton extends StatelessWidget {
  const AccountCreatedContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: GestureDetector(
        onTap: () {
          log("Account Created Continue Button");
          Get.to(const AccountSetup());
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
