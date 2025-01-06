import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learningapp/src/presentation/controllers/account_setup_controller.dart';

class TabItem extends StatelessWidget {
  final int index;
  final bool isSelected;

  const TabItem({super.key, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    AccountSetupController accountSetupController =
        Get.put(AccountSetupController());
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Container(
              height: 6,
              // width: MediaQuery.of(context).size.width / 3 - 20,
              width: accountSetupController.selectedIndex.value == index
                  ? 120
                  : MediaQuery.of(context).size.width / 3 - 20,
              decoration: BoxDecoration(
                  color: accountSetupController.selectedIndex.value == index
                      ? Colors.black
                      : Colors.grey[400],
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      ),
    );
  }
}
