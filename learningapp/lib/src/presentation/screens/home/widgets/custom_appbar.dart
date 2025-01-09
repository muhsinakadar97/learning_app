import 'package:flutter/material.dart';

import '../../../../config/theme/colors.dart';


class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: AppColors.indigoDark,
    );
  }
}
