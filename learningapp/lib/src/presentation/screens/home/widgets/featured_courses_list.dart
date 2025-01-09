import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/colors.dart';
import '../../../../data/models/course.dart';
import '../../../controllers/home_controller.dart';
import 'explore_button.dart';

class FeaturedCoursesList extends StatelessWidget {
  const FeaturedCoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();

    return Obx(() => SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              Course course = homeController.featuredCoursesList[index];

              return Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        homeController.onFeaturedCourseTapped(index);
                      },
                      child: Container(
                        height: 280,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blueGrey.withOpacity(0.4),
                              blurRadius: 5,
                              spreadRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: Text(
                                    course.courseName,
                                    style: GoogleFonts.raleway(
                                      color: AppColors.blueGrey800,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 20),
                                  child: Container(
                                    height: 30,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.amberColor,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "New",
                                        style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                  height: 130,
                                  width: double.infinity,
                                  child: Image.asset(
                                    course.logo,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Container(
                                height: 1.3,
                                width: double.infinity,
                                color: AppColors.blackColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    course.rate,
                                    style: GoogleFonts.raleway(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blueGrey800,
                                    ),
                                  ),
                                  const ExploreButton()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: homeController.featuredCoursesList.length,
          ),
        ));
  }
}
