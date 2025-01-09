import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learningapp/src/presentation/controllers/otp_controller.dart';
import 'package:learningapp/src/presentation/screens/enter_otp/widgets/appbar_title.dart';
import 'package:learningapp/src/presentation/screens/enter_otp/widgets/enter_otp_footer.dart';

import '../../../config/theme/colors.dart';

class EnterOtp extends StatelessWidget {
  const EnterOtp({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController otpController = Get.put(OtpController());

    return Scaffold(
      backgroundColor: AppColors.blueGreyLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: const AppbarTitle(),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return Container(
                  height: 50,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.blackColor, width: 2),
                  ),
                  child: TextField(
                    controller: otpController.otpControllers[index],
                    focusNode: otpController.focusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1, // Only 1 character per box
                    textAlign: TextAlign.center,
                    onChanged: (value) =>
                        otpController.onTextChanged(value, index),
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                  ),
                );
              }),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: EnterOtpFooter(),
          ),
        ],
      ),
    );
  }
}
