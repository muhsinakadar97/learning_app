import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/controllers/target_areas_controller.dart';

import 'subject_item_weeknesses.dart';

class Weeknesses extends StatelessWidget {
  const Weeknesses({super.key});

  @override
  Widget build(BuildContext context) {
    TargetAreasController targetAreasController =
        Get.find<TargetAreasController>();
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 280,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 5, bottom: 20, right: 5, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const RotatedBox(
                  quarterTurns: 4,
                  child: Icon(
                    Icons.thumb_down,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    "Weeknesses",
                    style: GoogleFonts.raleway(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: SizedBox(
            height: 300, // Optional: Keep height constraint if you need it.
            child: ListView.builder(
              primary: false,
              // physics: const ScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      log("strength - subject item selected");
                      targetAreasController.weeknessIsSelected.value = true;
                      targetAreasController.weeknessSelectedIndex.value = index;
                    },
                    child: SubjectItemWeeknesses(index: index,));
              },
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
