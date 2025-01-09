import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/config/data_state/data_state.dart';
import 'package:learningapp/src/config/network/failure.dart';
import 'package:learningapp/src/config/theme/colors.dart';

import '../../../../data/models/section.dart';
import '../../../controllers/course_overview_controller.dart';

class ChapterList extends StatelessWidget {
  const ChapterList({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the CourseOverviewController instance
    CourseOverviewController courseOverviewController =
        Get.find<CourseOverviewController>();

    // Handling loading or error states
    return Obx(() {
      if (courseOverviewController.sectionState.value ==
          DataState<List<Section>>.initial()) {
        return const Center(child: CircularProgressIndicator());
      }

      if (courseOverviewController.sectionState.value ==
          DataState<List<Section>>.failure(
              Failure(message: courseOverviewController.errorMessage.value))) {
        return Center(
          child: Text(
            'Error: ${courseOverviewController.errorMessage.value}',
            style: GoogleFonts.raleway(fontSize: 18, color: AppColors.redColor),
          ),
        );
      }

      if (courseOverviewController.sections.isEmpty) {
        return Center(
          child: Text(
            'No sections found.',
            style: GoogleFonts.raleway(fontSize: 18),
          ),
        );
      }

      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, sectionIndex) {
            // Get the current section
            Section currentSection =
                courseOverviewController.sections[sectionIndex];

            // Set the selected section
            courseOverviewController.selectedSection = currentSection;

            // Display section details
            return Column(
              children: [
                // Section header
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Text(
                        'Section ${currentSection.sectionNo} - ${currentSection.sectionName}',
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Displaying chapters for the current section
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: currentSection.chapters.length,
                  itemBuilder: (context, chapterIndex) {
                    // Get the current chapter
                    final chapter = currentSection.chapters[chapterIndex];

                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, right: 20, left: 20),
                      child: GestureDetector(
                        onTap: () {
                          // Handle chapter selection
                          courseOverviewController.onChapterSelected(
                            currentSection,
                            chapterIndex,
                          );
                        },
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.only(left: 10, right: 8),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColors.blueGreyLight,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Chapter number and name
                              Expanded(
                                flex: 7,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Row(
                                      children: [
                                        SizedBox(
                                          width: constraints.minWidth / 9,
                                          height: constraints.maxHeight,
                                          child: Center(
                                            child: Text(
                                              '${chapter.chapterNo}.',
                                              style: GoogleFonts.raleway(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: constraints.maxWidth -
                                              (constraints.minWidth / 9),
                                          height: constraints.maxHeight,
                                          child: Center(
                                            child: Row(
                                              children: [
                                                const SizedBox(width: 4),
                                                Expanded(
                                                  child: Text(
                                                    chapter.chapterName,
                                                    maxLines: 2,
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              // Chapter category (Locked, Premium, or Free)
                              Flexible(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    chapter.category,
                                    style: GoogleFonts.raleway(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          _getCategoryColor(chapter.category),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            );
          },
          childCount: courseOverviewController.sections.length,
        ),
      );
    });
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Locked':
        return AppColors.redColor;
      case 'Premium':
        return AppColors.premiumTextColor;
      default:
        return AppColors.freeTextColor;
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../../data/models/section.dart';
// import '../../../controllers/course_overview_controller.dart';

// class ChapterList extends StatelessWidget {
//   const ChapterList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Fetch the CourseOverviewController instance
//     CourseOverviewController courseOverviewController =
//         Get.find<CourseOverviewController>();

//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         (context, sectionIndex) {
//           // Get the current section
//           Section currentSection =
//               courseOverviewController.sections[sectionIndex];

//           // Set the selected section
//           courseOverviewController.selectedSection = currentSection;

//           // Display section details
//           return Column(
//             children: [
//               // Section header
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 50,
//                 child: Row(
//                   children: [
//                     const SizedBox(width: 20),
//                     Text(
//                       'Section ${currentSection.sectionNo} - ${currentSection.sectionName}',
//                       style: GoogleFonts.raleway(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),

//               // Displaying chapters for the current section
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: currentSection.chapters.length,
//                 itemBuilder: (context, chapterIndex) {
//                   // Get the current chapter
//                   final chapter = currentSection.chapters[chapterIndex];

//                   return Padding(
//                     padding:
//                         const EdgeInsets.only(bottom: 10, right: 20, left: 20),
//                     child: GestureDetector(
//                       onTap: () {
//                         // Handle chapter selection
//                         courseOverviewController.onChapterSelected(
//                           currentSection,
//                           chapterIndex,
//                         );
//                       },
//                       child: Container(
//                         height: 60,
//                         padding: const EdgeInsets.only(left: 10, right: 8),
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           color: Colors.blueGrey[50],
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // Chapter number and name
//                             Expanded(
//                               flex: 7,
//                               child: LayoutBuilder(
//                                 builder: (context, constraints) {
//                                   return Row(
//                                     children: [
//                                       SizedBox(
//                                         width: constraints.minWidth / 9,
//                                         height: constraints.maxHeight,
//                                         child: Center(
//                                           child: Text(
//                                             '${chapter.chapterNo}.',
//                                             style: GoogleFonts.raleway(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: constraints.maxWidth -
//                                             (constraints.minWidth / 9),
//                                         height: constraints.maxHeight,
//                                         child: Center(
//                                           child: Row(
//                                             children: [
//                                               const SizedBox(width: 4),
//                                               Expanded(
//                                                 child: Text(
//                                                   chapter.chapterName,
//                                                   maxLines: 2,
//                                                   textAlign: TextAlign.start,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   style: GoogleFonts.raleway(
//                                                       fontSize: 16),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                             ),
//                             // Chapter category (Locked, Premium, or Free)
//                             Flexible(
//                               flex: 2,
//                               child: Center(
//                                 child: Text(
//                                   chapter.category,
//                                   style: GoogleFonts.raleway(
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.bold,
//                                     color: _getCategoryColor(chapter.category),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 20),
//             ],
//           );
//         },
//         childCount: courseOverviewController.sections.length,
//       ),
//     );
//   }

//   // Function to get category color based on the chapter's category
//   Color _getCategoryColor(String category) {
//     switch (category) {
//       case 'Locked':
//         return Colors.red;
//       case 'Premium':
//         return Colors.orange;
//       default:
//         return Colors.green;
//     }
//   }
// }
