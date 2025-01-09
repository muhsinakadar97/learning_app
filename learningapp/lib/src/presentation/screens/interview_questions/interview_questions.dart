import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../../controllers/interview_questions_controller.dart';
import '../../../config/theme/colors.dart';
import '../../controllers/interview_questions_controller.dart';
import '../widgets/network_aware.dart';
import 'widgets/question_widget.dart';

class InterviewQuestions extends StatelessWidget {
  const InterviewQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    InterviewQUestionsController interviewQUestionsController =
        Get.put(InterviewQUestionsController());

    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,

          title: Text(
            'Interview Questions',
            style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.whiteColor,
          automaticallyImplyLeading: false, // Hide the back button
        ),
        body: const NetworkAware(child: QuestionWidget()));
  }
}
