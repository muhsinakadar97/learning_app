import "dart:developer";
import "dart:io";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:learningapp/src/data/repositories/purchased_courses_impl/purchased_courses_impl.dart";
import "package:learningapp/src/domain/repositories/purchased_course_repo/purchased_course_repo.dart";

import "../../config/data_state/data_state.dart";
import "../../data/models/course.dart";
import "../../data/repositories/course_repo_impl/course_repo_impl.dart";
import "../../domain/repositories/course_repo/course_repo.dart";
import "../screens/course_overview/course_overview.dart";
import "../screens/doubts/doubts.dart";
import "../screens/home/home.dart";
import "../screens/notes/notes.dart";
import "../screens/settings/settings.dart";
import "../screens/widgets/network_aware.dart";

class HomeController extends GetxController {
  RxList<Course> courseList = RxList([]);
  RxList<Course> purchasedCoursesList = RxList([]);
  RxList<Course> featuredCoursesList = RxList([]);
  final CourseRepo courseRepo = CourseRepoImpl();
  final PurchasedCourseRepo purchasedCourseRepo = PurchasedCoursesImpl();
  Rx<DataState<List<Course>>> state = DataState<List<Course>>.initial().obs;
  Rx<DataState<List<Course>>> purchasedCoursesState =
      DataState<List<Course>>.initial().obs;

  @override
  onInit() {
    super.onInit();
    fetchCourses();
    fetchPurchasedCourses();
  }

  // method to fetch Course List
  void fetchCourses() async {
    state.value = DataState.initial();
    final result = await courseRepo.fetchCourses();

    result.fold(
      (failure) {
        state.value = DataState.failure(failure);
      },
      (courses) {
        state.value = DataState.success(courses);

        featuredCoursesList.value = courses;
        log("Featured Courses => $featuredCoursesList");
      },
    );
  }
  
  // fetch purchased course list
  void fetchPurchasedCourses() async {
    state.value = DataState.initial();
    final result = await purchasedCourseRepo.fetchPurchasedCourses();

    result.fold(
      (failure) {
        state.value = DataState.failure(failure);
      },
      (purchasedCourses) {
        state.value = DataState.success(purchasedCourses);

        purchasedCoursesList.value = purchasedCourses;
        log("Purchased Courses => $purchasedCoursesList");
      },
    );
  }

  RxString selectedItemName = "".obs;
  RxString selectedImage = "".obs;
  RxInt currentIndex = 0.obs;

  int selectedIndex = 0;

  final pages = [
    const NetworkAware(child: Home()),
    NetworkAware(child: Notes()),
    NetworkAware(child: Doubts()),
    const NetworkAware(child: Settings()),
  ];

  // handle course selection
  void onFeaturedCourseTapped(int index) {
    Course course = featuredCoursesList[index];
    log("Selected Course => ${course.courseName}");
    selectedItemName.value = course.courseName;
    selectedImage.value = course.logo;
    currentIndex.value = index;
    Get.to(const CourseOverview());
  }

// handle click in purchased course item
  void onPurchasedCourseTapped(int index) {
    Course course = purchasedCoursesList[index];
    log("Selected Course => ${course.courseName}");
    selectedItemName.value = course.courseName;
    selectedImage.value = course.logo;
    currentIndex.value = index;
    Get.to(const CourseOverview());
  }

  // handle back press
  Future<bool> onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.blueGrey[50],
            title: Text(
              "Are you sure?",
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Do you want to exit the app?",
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("No",
                      style: GoogleFonts.raleway(color: Colors.blueGrey))),
              TextButton(
                onPressed: () => exit(0),
                child: Text("Yes",
                    style: GoogleFonts.raleway(color: Colors.blueGrey)),
              ),
            ],
          ),
        )) ??
        false;
  }
}
