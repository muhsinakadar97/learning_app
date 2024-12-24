import "dart:developer";
import "dart:io";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

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
  final CourseRepo courseRepo = CourseRepoImpl();
  Rx<DataState<List<Course>>> state = DataState<List<Course>>.initial().obs;

  @override
  onInit() {
    super.onInit();
    fetchCourses();
  }

//   import 'package:app_design/src/core/data_state/data_state.dart';
// import 'package:app_design/src/domain/repositories/item_repo/item_repo.dart';
// import 'package:get/get.dart';

// class ItemController extends GetxController {
//   final ItemRepository repository;

//   var state = DataState<List<String>>.initial().obs;

//   ItemController(this.repository);

//   void fetchItems() async {
//     state.value = DataState.initial();
//     final result = await repository.getItems();
//     result.fold(
//       (failure) => state.value = DataState.failure(failure),
//       (items) => state.value = DataState.success(items),
//     );
//   }
// }

  void fetchCourses() async {
    state.value = DataState.initial();
    final result = await courseRepo.fetchCourses();
    log("result from home controller => $result");

    result.fold(
      (failure) {
        state.value = DataState.failure(failure);
      },
      (courses) {
        state.value = DataState.success(courses);

        courseList.value = courses;
      },
    );
  }

  // fetching the available courses
  // Future fetchCourses() async {
  //   courseList.value = (courseList as List<dynamic>).map((e) {
  //     return Course.fromJson(e);
  //   }).toList();
  // }

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
  void onCourseTapped(int index) {
    Course course = courseList[index];
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
