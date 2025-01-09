import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/controllers/otp_controller.dart';
import 'package:learningapp/src/presentation/screens/account_created/account_created.dart';

import '../../../../config/theme/colors.dart';

class EnterOtpContinueButton extends StatelessWidget {
  const EnterOtpContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController otpController = Get.put(OtpController());
    return GestureDetector(
      onTap: () {
        Get.to(const AccountCreated());
        // otpController.afterEntertext();
        // otpController.otpTextController.text.length == 6 ?
        // log("otpController.otpTextController.text => ${otpController.otpTextController.text}") : log("Please enter a 6 digit OTP");
      },
      // onTap: () {
      //   log("Submitted");
      //   otpController.submitOtp();
      //   if(otpController.enteredOtp.value == "123456") {
      //     Get.to(const AccountCreated());
      //   }

      // },
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.blueGreyDark,
              borderRadius: BorderRadius.circular(30),
            ),
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
        ],
      ),
    );
  }
}
