import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DoubtsController extends GetxController {
  var doubtText = ''.obs; // Observable text
  TextEditingController doubtTextController = TextEditingController();
  FocusNode focusNode = FocusNode();
  RxBool isDoubtEmpty = true.obs;

  // method to submit doubt
  void submitDoubt(BuildContext context) {
    doubtText.value = doubtTextController.text;
    log("Your Doubt => ${doubtText.value}");
    doubtText.value == ""
        ? showEmptyBottomSheet(context)
        : showSubmittedBottomSheet(context);
    isDoubtEmpty.value = false;
  }

  // shows modal bottom sheet when  the doun=bt is submitted
  void showEmptyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 60,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Center(
            child: Text(
              "You are not entered any doubt. Enter your doubts and submit again!!!",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 12),
            ),
          ),
        );
      },
    );
  }

  // Method to show the bottom sheet
  void showSubmittedBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 60,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Center(
            child: Text(
              "Your doubt has been submitted. We will check it soon.",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 12),
            ),
          ),
        );
      },
    );
  }

// method to handle back press
  Future<bool> onWillPop(BuildContext context) async {
    return false;
  }

  @override
  void onClose() {
    doubtTextController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
