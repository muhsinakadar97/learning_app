import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  // Creating a list of controllers for each OTP input container
  List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());

  // List of FocusNodes for each OTP container
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void onInit() {
    super.onInit();
    
    // Adding listeners to each controller
    otpControllers.forEach((controller) {
      controller.addListener(afterTextChanged);
    });
  }

  void afterTextChanged() {
    String enteredOtp = otpControllers.map((e) => e.text).join('');
    log("Entered OTP: $enteredOtp");
  }

  // Function to move focus after entering text
  void onTextChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      // Move focus to the next field
      FocusScope.of(Get.context!).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      // Move focus back to the previous field when deleting text
      FocusScope.of(Get.context!).requestFocus(focusNodes[index - 1]);
    }
  }



  @override
  void dispose() {
    super.dispose();
    
    // Dispose controllers and focus nodes
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
  }
}
