import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/colors.dart';
import '../../../../data/models/chapter.dart';
import '../../../controllers/course_overview_controller.dart';
import '../../../controllers/view_video_controller.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    ViewVideoController viewVideoCtr = Get.find<ViewVideoController>();
    CourseOverviewController courseOverviewController =
        Get.find<CourseOverviewController>();

    return Expanded(
      child: Obx(
        () => ListView.builder(
          padding: EdgeInsets.only(
              bottom:
                  viewVideoCtr.listItemHeight * viewVideoCtr.chapterList.length,
              left: 10,
              right: 10,
              top: 10),
          controller: courseOverviewController.scrollController,
          itemCount: viewVideoCtr.chapterList.length,
          itemBuilder: (context, index) {
            Chapter chapter = viewVideoCtr.chapterList[index];
            return GestureDetector(
                onTap: () {
                  viewVideoCtr.updateKey();
                  viewVideoCtr.onItemTapped(context, index);
                },
                child: Obx(
                  () => Container(
                      height: 60,
                      padding: const EdgeInsets.only(left: 10, right: 8),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: viewVideoCtr.currentChapterName.value ==
                                chapter.chapterName
                            ? AppColors.indigoDark.withOpacity(0.2)
                            : AppColors.blueGreyLight,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                            Flexible(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    chapter.category,
                                    style: GoogleFonts.raleway(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: chapter.category == "Locked"
                                          ? AppColors.redColor
                                          : (chapter.category == "Premium"
                                              ? AppColors.premiumTextColor
                                              : AppColors.freeTextColor),
                                    ),
                                  ),
                                )),
                          ])),
                ));
          },
        ),
      ),
    );
  }
}
