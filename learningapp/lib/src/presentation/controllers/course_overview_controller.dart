import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/data_state/data_state.dart';
import '../../data/models/chapter.dart';
import '../../data/models/section.dart';
import '../../data/repositories/syllabus_repo_impl/syllabus_repo_impl.dart';
import '../../domain/repositories/syllabus_repo/syllabus_repo.dart';
import '../screens/video/video.dart';
import 'home_controller.dart';

class CourseOverviewController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  SyllabusRepo syllabusRepo = SyllabusRepoImpl();

  RxString selectedCourseName = "".obs;

  RxList<Section> sections = RxList([]);
  List<String> sectionNames = [];
  RxList<Chapter> chapterList = RxList([]);
  late Section selectedSection;
  Chapter? selectedChapter;

  RxString colorChapterName = "".obs;
  RxInt chapterCount = 0.obs;
  final ScrollController scrollController = ScrollController();
  Key mainListKey = UniqueKey();
  RxString currentVideoId = "".obs;
  Rx<DataState<List<Section>>> sectionState =
      DataState<List<Section>>.initial().obs;
  Rx<DataState<List<Chapter>>> chapterState =
      DataState<List<Chapter>>.initial().obs;

  // Error message if any
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSections(); // Ensure this is called first to load sections
    // fetchChaptersForSections(sections);
  }

  void fetchSections() async {
    sectionState.value = DataState.initial();
    final result =
        await syllabusRepo.fetchSections(homeController.selectedItemName.value);
    log("result from home controller => $result");

    result.fold(
      (failure) {
        sectionState.value = DataState.failure(failure);
        errorMessage.value = failure.message; // Set error message
      },
      (fetchedSections) {
        sectionState.value = DataState.success(fetchedSections);
        sections.value = fetchedSections; // Update sections list
      },
    );
  }

  // void fetchChaptersForSection(String sectionId) async {
  //   // Set the state to initial while loading
  //   chapterState.value = DataState.initial();

  //   // Fetch the chapters from the repository
  //   final result = await syllabusRepo.fetchChaptersForSection(sectionId);
  //   log("result from fetchChaptersForSection => $result");

  //   result.fold(
  //     (failure) {
  //       // On failure, update the state with the error
  //       chapterState.value = DataState.failure(failure);
  //     },
  //     (chapters) {
  //       // On success, update the state with the list of chapters
  //       chapterState.value = DataState.success(chapters);
  //     },
  //   );
  // }

  // Method to handle chapter selection
  onChapterSelected(Section currentSection, int chapterIndex) {
    Chapter currentChapter = currentSection.chapters[chapterIndex];
    log('Chapter : $currentChapter');

    setSection(
      section: currentSection,
      selectedChapterIndex: chapterIndex,
    );
    selectedChapter = currentSection.chapters[chapterIndex];
    Get.to(() => ViewVideo(
          videoIdForLoading: currentSection.chapters[chapterIndex].videoId,
          currentChapterName: currentSection.chapters[chapterIndex].chapterName,
          chapters: currentSection.chapters,
          sectionName: currentSection.sectionName,
        ));
    currentVideoId.value = currentChapter.videoId;
  }

  // Method to set the details of selected section
  void setSection(
      {required Section section, required int selectedChapterIndex}) {
    log('section => $section');
    log('chapters => ${section.chapters}');
    selectedSection = section;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
