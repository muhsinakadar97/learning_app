import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/screens/enter_otp/enter_otp.dart';

import '../../../../config/theme/colors.dart';

class VerifyNumberContinueButton extends StatelessWidget {
  const VerifyNumberContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
      child: GestureDetector(
        onTap: () {
          log("Submitted");
          Get.to(const EnterOtp());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
              color: AppColors.blueGreyDark,
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              "Continue",
              style: GoogleFonts.raleway(
                  color: AppColors.whiteColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
