import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/theme/colors.dart';
import '../../controllers/quiz_controller.dart';

class QuizResult extends StatelessWidget {
  final int score;

  const QuizResult({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.put(QuizController());
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     "Quiz Result",
      //     style: GoogleFonts.raleway(
      //         fontWeight: FontWeight.bold, color: AppColors.buttonColor),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => quizController.currentScore.value == 10
                  ? Text(
                      "Congratulations!!! you have got full marks!!!",
                      style: GoogleFonts.raleway(
                          fontSize: 17,
                          color: AppColors.pinkColor,
                          fontWeight: FontWeight.bold),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Your Score",
                style: GoogleFonts.raleway(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                "${quizController.currentScore} / ${Get.find<QuizController>().quizQuestionsList.length}",
                // quizController.isReset.value
                //     ? "0"
                //     : "$score / ${Get.find<QuizController>().quizQuestionsList.length}",
                style: GoogleFonts.raleway(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: quizController.currentScore.value == 10
                        ? AppColors.teal700
                        : AppColors.indigoColor),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 20, left: 20, right: 20),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.indigoColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "BACK TO QUIZ",
                      style: GoogleFonts.raleway(
                          color: AppColors.whiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
