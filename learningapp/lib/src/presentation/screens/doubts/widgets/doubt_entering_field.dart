import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/colors.dart';
import '../../../controllers/doubts_controller.dart';

class DoubtEnteringField extends StatelessWidget {
  const DoubtEnteringField({super.key});

  @override
  Widget build(BuildContext context) {
    DoubtsController doubtsController = Get.find<DoubtsController>();
    return Container(
      height: 120,
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextField(
        minLines: null,
        maxLines: null,
        cursorColor: AppColors.blueGreyDark,
        expands: true,
        keyboardType: TextInputType.multiline,
        controller: doubtsController.doubtTextController,
        decoration: InputDecoration(
          hintText: 'Ask your doubts here...',
          hintStyle: const TextStyle(color: AppColors.blueGrey100),
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.blueGreyDark, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.blueGreyDark),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 10.0,
          ),
        ),
        style: GoogleFonts.raleway(),
      ),
    );
  }
}
