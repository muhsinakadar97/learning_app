import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/account_setup_controller.dart';
import 'course_listtile.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    AccountSetupController accountSetupController =
        Get.put(AccountSetupController());
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.only(bottom: 100),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            log("Selected index => $index");
            accountSetupController.selectedIndex.value = index;
          },
          child: CourseListTile(index: index), // Pass index to the tile
        );
      },
    );
  }
}
