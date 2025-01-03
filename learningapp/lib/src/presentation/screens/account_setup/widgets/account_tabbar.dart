import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learningapp/src/presentation/controllers/account_setup_controller.dart';
import 'package:learningapp/src/presentation/screens/target_areas/target_areas.dart';
import 'package:learningapp/src/presentation/screens/target_course/target_course.dart';

import 'tab_item.dart';

class AccountTabbar extends StatelessWidget {
  const AccountTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the instance of AccountSetupController
    AccountSetupController accountSetupController =
        Get.put(AccountSetupController());

    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(
            // Center the entire ListView horizontally
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      accountSetupController.selectedIndex.value = index;
                      log("accountSetupController.selectedIndex.value => ${accountSetupController.selectedIndex.value}");
                      accountSetupController.changePage(index); // Change page when tab is tapped
                    },
                    child: Obx(() {
                      bool isSelected =
                          accountSetupController.selectedIndex.value == index;
                      return Center(
                        child: Row(
                          children: [
                            SetupTabItem(index: index, isSelected: isSelected),
                            const SizedBox(width: 3), // Space between tabs
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
        ),
        Flexible(
          child: PageView(
            controller: accountSetupController.pageController,
            onPageChanged: accountSetupController.onPageChanged, // Sync tab with page
            children: const [
              TargetCourse(),
              TargetAreas(),
              TargetCourse(),
            ],
          ),
        ),
      ],
    );
  }
}
