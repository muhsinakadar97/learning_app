import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/controllers/account_setup_controller.dart';

class TargetAreasSubmitButton extends StatelessWidget {
  const TargetAreasSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    AccountSetupController accountSetupController =
        Get.find<AccountSetupController>();
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: GestureDetector(
          onTap: () {
            log("Target Course Submitted");
            accountSetupController.changePage(2);
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 25,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Submit",
                style: GoogleFonts.raleway(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
