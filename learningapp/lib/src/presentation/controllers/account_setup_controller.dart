import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSetupController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isSelected = false.obs;
  RxInt currentIndex = 0.obs;

  RxInt weeknessSelectedIndex = 0.obs;
  RxBool strengthIsSelected = false.obs;
  RxInt weeknessCurrentIndex = 0.obs;
  RxInt strengthSelectedIndex = 0.obs;
  RxBool weeknessIsSelected = false.obs;
  RxInt strengthcurrentIndex = 0.obs;

  RxInt tabSelectedIndex = 0.obs;
  final PageController pageController = PageController();

  // Function to change the page when a tab is tapped
  void changePage(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index); // Immediately change the page
  }

  // Function to update the selected tab index when the page is swiped
  void onPageChanged(int index) {
    selectedIndex.value = index;
  }
}
