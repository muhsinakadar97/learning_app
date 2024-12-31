import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learningapp/src/config/data_state/data_state.dart';
import 'package:learningapp/src/data/repositories/syllabus_repo_impl/syllabus_repo_impl.dart';
import 'package:learningapp/src/domain/repositories/syllabus_repo/syllabus_repo.dart';

import '../../data/models/chapter.dart';
import 'course_overview_controller.dart';

class ViewVideoController extends GetxController {
  double listItemHeight = 250.0;
  // RxBool isFullscreen = false.obs;

  ScrollController scrollController = ScrollController();
  Rx<UniqueKey> videoWidgetKey = Rx(UniqueKey()); // Retain UniqueKey
  CourseOverviewController courseOverviewController =
      Get.find<CourseOverviewController>();
  RxBool isFullscreen = false.obs;
  RxString name = "Dictionary".obs;

  Rx<DataState<List<Chapter>>> chapterState =
      DataState<List<Chapter>>.initial().obs;
  SyllabusRepo syllabusRepo = SyllabusRepoImpl();

  // method to update the value of the key
  void updateKey() {
    videoWidgetKey.value = UniqueKey();
  }

  // TABBAR

  final PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;
  RxBool isTapped = false.obs;

  RxList<bool> isSelectedList = List.generate(10, (index) => false).obs;
  final List<Map<String, dynamic>> tabItems = [
    {'icon': Icons.video_stable_rounded, 'title': 'Videos'},
    {'icon': Icons.note, 'title': 'Notes'},
    {'icon': Icons.book, 'title': 'Expert\nVideos'},
    {'icon': Icons.video_library, 'title': 'Doubts'},
    {'icon': Icons.image, 'title': 'FAQ'},
    {'icon': Icons.music_note, 'title': 'Practice\nQuestions'},
    {'icon': Icons.star, 'title': 'Quiz'},
    {'icon': Icons.settings, 'title': 'Interview\nQuestions'},
  ];

  // NEXT VIDEO

  RxInt selectedChapterIndex = 0.obs;
  RxString selectedVideoId = "".obs;
  RxBool isVideoPlaying = false.obs;

  // RxList<Chapter> chapters = RxList([]);

  RxString currentVideoId = "".obs;
  RxString currentChapterName = "".obs;
  RxString currentSectionName = "".obs;

  RxList<Chapter> chapterList = RxList([]);

  // // fetch section wise chapters
  // void fetchChaptersForSections(Section section) {
  //   chapters.assignAll(section.chapters);
  //   log("chapters from nextvideo => $chapters");
  // }

  // Method to fetch chapters for a selected section
  // Future<void> fetchChaptersForSection(Section selectedSection) async {
  //   chapterState.value = DataState.initial(); // Initializing state

  //   // Fetch chapters for the selected section using the repository
  //   // final result = await syllabusRepo.fetchChaptersForSection(selectedSection);

  //   result.fold(
  //     (failure) {
  //       chapterState.value = DataState.failure(failure); // Handling failure
  //     },
  //     (List<Chapter> chapters) {
  //       chapterState.value = DataState.success(
  //           chapters); // Handling success with a list of chapters
  //       chapterList.value = chapters; // Updating the chapter list
  //     },
  //   );
  // }

  @override
  void onInit() {
    super.onInit();

    setVideoDetails();
  }

  // when select a chapter
  void onItemTapped(BuildContext context, int index) {
    Chapter selectedChapter = chapterList[index];
    log(selectedChapter.toString());

    log("Selected Chapter from Next Video => ${selectedChapter.chapterName}");
    currentChapterName.value = selectedChapter.chapterName;
    scrollToSelectedIndex(index);
    log("courseOverviewController.selectedSection.chapters => ${courseOverviewController.selectedSection.chapters}");
  }

  // method to set selected video details
  void setVideoDetails() {
    setCurrentVideoId(
        videoId: courseOverviewController.selectedChapterVideoId.value);
    setCurrentChapterName(
        chapterName: courseOverviewController.selectedChapterName.value);
    setCurrentChapterList(
        chapters: courseOverviewController.selectedChapterList);
    setCurrentSectionName(
        sectionName: courseOverviewController.selectedSectionName.value);
  }

  // method to set video id
  String setCurrentVideoId({required String videoId}) {
    currentVideoId.value = videoId;
    return currentVideoId.value;
  }

  // method to set chapter name
  void setCurrentChapterName({required String chapterName}) {
    currentChapterName.value = chapterName;
  }

// method to set section name
  void setCurrentSectionName({required String sectionName}) {
    currentSectionName.value = sectionName;
  }

// method to set chapter list
  void setCurrentChapterList({required List<Chapter> chapters}) {
    chapterList.value = chapters;
  }

// method to scroll the list to selected index
  void scrollToSelectedIndex(int index) {
    double itemHeight = 70.0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (courseOverviewController.scrollController.hasClients) {
        double targetOffset = index * itemHeight;

        // Debugging logs
        log("Scrolling to index: $index");
        log("Target offset: $targetOffset");

        // Ensure the targetOffset does not exceed the scrollable area
        double maxOffset =
            courseOverviewController.scrollController.position.maxScrollExtent;
        targetOffset = targetOffset.clamp(0.0, maxOffset);

        // Debugging log to check max scroll extent
        log("Max scroll extent: $maxOffset");

        // Animate to the target offset
        courseOverviewController.scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

// method to toggle fullscreen
  void toggleFullscreen(bool value) {
    isFullscreen.value = value;
    log("Fullscreen state changed: $value");
  }

  @override
  void dispose() {
    scrollController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
