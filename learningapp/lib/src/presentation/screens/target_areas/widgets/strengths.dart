import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/controllers/account_setup_controller.dart';
import 'package:learningapp/src/presentation/screens/target_areas/widgets/subject_item_strengths.dart';

class Strengths extends StatelessWidget {
  const Strengths({super.key});

  @override
  Widget build(BuildContext context) {
    AccountSetupController accountSetupController =
        Get.find<AccountSetupController>();

    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 280,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 5, bottom: 20, top: 20, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const RotatedBox(
                  quarterTurns: 4,
                  child: Icon(
                    Icons.thumb_up,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    "Strengths",
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
                      accountSetupController.strengthIsSelected.value = true;
                      accountSetupController.strengthSelectedIndex.value =
                          index;
                    },
                    child: SubjectItemStrengths(
                      index: index,
                    ));
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
