import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/interview_questions_controller.dart';


class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    InterviewQUestionsController interviewQUestionsController =
        Get.find<InterviewQUestionsController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20, right: 20),
        itemCount: interviewQUestionsController.interviewQuestionsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                interviewQUestionsController.toggleExpansion(index);
              },
              child: Obx(() => Container(
                    width: MediaQuery.of(context).size.width - 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                interviewQUestionsController
                                    .interviewQuestionsList[index]["question"]!,
                                style: GoogleFonts.raleway(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // Show answer only if the item is expanded
                        interviewQUestionsController.isExpandedList[index]
                            ? Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        interviewQUestionsController
                                                .interviewQuestionsList[index]
                                            ["answer"]!,
                                        style:
                                            GoogleFonts.raleway(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}