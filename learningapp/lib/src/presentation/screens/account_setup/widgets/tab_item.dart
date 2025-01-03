import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learningapp/src/presentation/controllers/account_setup_controller.dart';

class SetupTabItem extends StatelessWidget {
  final int index;
  final bool isSelected;

  const SetupTabItem(
      {super.key, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    AccountSetupController accountSetupController =
        Get.put(AccountSetupController());
    return Container(
      height: 5,
      width: accountSetupController.selectedIndex.value == index ? 120 : 110,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
    );
  }
}
