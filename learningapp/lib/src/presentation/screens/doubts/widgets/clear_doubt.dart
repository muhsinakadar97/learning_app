import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/controllers/doubts_controller.dart';

import '../../../../config/theme/colors.dart';

class ClearDoubt extends StatelessWidget {
  const ClearDoubt({super.key});

  @override
  Widget build(BuildContext context) {
    DoubtsController doubtsController = Get.find<DoubtsController>();
    return Align(
      alignment: Alignment.topRight, // Aligning the button to the top-right
      child: Padding(
        padding: const EdgeInsets.only(
            right: 20.0), // Optional padding for positioning
        child: GestureDetector(
          onTap: () {
            doubtsController.doubtTextController.clear();
          },
          child: Container(
            width: 150,
            height: 40,
            decoration: const BoxDecoration(
                color: AppColors.blueGrey900,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                "Clear Doubt",
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.whiteColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
