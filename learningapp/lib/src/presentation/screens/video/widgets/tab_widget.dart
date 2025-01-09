import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/colors.dart';
import '../../../controllers/view_video_controller.dart';

class TabWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected; // Add this line
  final int index;

  const TabWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
    this.isSelected = false, // Default value for isSelected
  });

  @override
  Widget build(BuildContext context) {
    ViewVideoController viewVideoController = Get.find<ViewVideoController>();
    return Obx(
      () => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.blackColor,

              // color: viewVideoController.selectedIndex.value == index
              //     ? AppColors.blackColor
              //     : AppColors.whiteColor,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: GoogleFonts.raleway(
                  color: AppColors.blackColor,
                  // color: viewVideoController.selectedIndex.value == index
                  //     ? AppColors.blackColor
                  //     : AppColors.whiteColor,
                  fontSize: viewVideoController.selectedIndex.value == index
                      ? 15
                      : 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
