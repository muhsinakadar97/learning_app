import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/config/data_state/data_state.dart';
import 'package:learningapp/src/data/models/section.dart';
import 'package:learningapp/src/presentation/screens/course_overview/widgets/chapter_list.dart';

import '../../../../config/theme/colors.dart';
import '../../../controllers/course_overview_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../widgets/network_aware.dart';

class CouseOverviewBody extends StatelessWidget {
  const CouseOverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();

    if (Get.isRegistered<CourseOverviewController>() == false) {
      CourseOverviewController courseOverviewController =
          Get.put(CourseOverviewController());
    } else {
      Get.find<CourseOverviewController>();
    }

    return SafeArea(
      child: NetworkAware(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Image.asset(homeController.selectedImage.value),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // Course title text
                    Text(
                      homeController.selectedItemName.value,
                      style: GoogleFonts.raleway(
                        color: AppColors.blueGreyDark,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Display sections if they are available
            Obx(() {
              final courseOverviewController =
                  Get.find<CourseOverviewController>();

              if (courseOverviewController.sectionState.value ==
                  DataState<List<Section>>.initial()) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (courseOverviewController.sectionState.value ==
                  DataState<List<Section>>.failure) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      courseOverviewController.errorMessage.value,
                      style: GoogleFonts.raleway(
                        color: AppColors.redColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              } else if (courseOverviewController.sections.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "No Sections Found",
                      style: GoogleFonts.raleway(
                        color: AppColors.redColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              } else {
                return const ChapterList();
                // // If sections are fetched, show them
                // return SliverList(
                //   delegate: SliverChildBuilderDelegate(
                //     (context, index) {
                //       final section = courseOverviewController.sections[index];
                //       sreturn ExpansionTile(
                //         title: Text(
                //           section.sectionName,
                //           style: GoogleFonts.raleway(
                //             color: Colors.blueGrey[900],
                //             fontSize: 18,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //         children: [
                //           ...section.chapters.map((chapter) {
                //             return ListTile(
                //               title: Text(
                //                 chapter.chapterName,
                //                 style: GoogleFonts.raleway(
                //                   fontSize: 16,
                //                   color: Colors.blueGrey[600],
                //                 ),
                //               ),
                //               onTap: () {
                //                 // Handle chapter selection
                //                 courseOverviewController.onChapterSelected(
                //                   section,
                //                   section.chapters.indexOf(chapter),
                //                 );
                //               },
                //             );
                //           }),
                //         ],
                //       );
                //     },
                //     childCount: courseOverviewController.sections.length,
                //   ),
                // );
              }
            }),
          ],
        ),
      ),
    );
  }
}
