import 'package:flutter/material.dart';

import '../../../../config/theme/colors.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      top: 30,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          Icons.person,
          size: 40,
          color: AppColors.indigoDark.withOpacity(0.15),
        ),
      ),
    );
  }
}
