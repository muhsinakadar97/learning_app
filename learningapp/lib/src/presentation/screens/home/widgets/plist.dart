import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/models/course.dart';
import '../../../controllers/home_controller.dart';
import 'explore_button.dart';

class Plist extends StatelessWidget {
  const Plist({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();

    return Obx(() => SizedBox(
          // color: Colors.amberAccent,
          height: 245, // Set a fixed height for the horizontal list
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              itemCount: homeController.purchasedCoursesList.length,
              itemBuilder: (BuildContext context, int index) {
                Course course = homeController.purchasedCoursesList[index];

                return GestureDetector(
                  onTap: () {
                    homeController.onPurchasedCourseTapped(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                        right: 20,
                        bottom: 20), // Add spacing only between items
                    child: Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width -
                          40, // Subtract 40 from the width
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        // border: const Border(
                        //     left: BorderSide(
                        //         width: 2,
                        //         style: BorderStyle.solid,
                        //         color: Colors.grey),
                        //     right: BorderSide(
                        //         width: 2,
                        //         style: BorderStyle.solid,
                        //         color: Colors.grey),
                        //     bottom: BorderSide(
                        //         width: 2,
                        //         style: BorderStyle.solid,
                        //         color: Colors.grey))
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.4),
                            blurRadius: 5,
                            spreadRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 120,
                              width: double.infinity,
                              child: Image.asset(
                                course.logo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: Container(
                              height: 1.3,
                              width: double.infinity,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  course.rate,
                                  style: GoogleFonts.raleway(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueGrey[800],
                                  ),
                                ),
                                // Use Expanded to dynamically size the ExploreButton
                                const Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: ExploreButton(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
