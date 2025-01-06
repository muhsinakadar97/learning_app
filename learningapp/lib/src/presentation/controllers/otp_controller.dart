import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());

  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  RxString enteredOtp = "".obs;

  void onTextChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(Get.context!).requestFocus(focusNodes[index + 1]);
    }
  }

  void submitOtp() {
    String otp = controllers.map((controller) => controller.text).join('');
    enteredOtp.value = otp;
    log("Full OTP entered: ${enteredOtp.value}");
  }
  // String otp = controllers.map((controller) => controller.text).join('');
  //   print("Full OTP entered: $otp");

  @override
  void dispose() {
    // Dispose of controllers and focus nodes when the controller is destroyed
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
