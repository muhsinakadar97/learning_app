import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/theme/colors.dart';
import '../../controllers/practice_questions_controller.dart';
import '../notes/widgets/custom_listtile.dart';
import '../widgets/network_aware.dart';

class PracticeQuestions extends StatelessWidget {
  final PracticeQuestionsController notesController =
      Get.put(PracticeQuestionsController());

  PracticeQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Practice Questions',
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false, // Hide the back button
      ),
      body: NetworkAware(
        child: ListView.builder(
          itemCount: notesController.notesList.length,
          itemBuilder: (context, index) {
            final note = notesController.notesList[index];
            return CustomListTile(
              pdfImagePath:
                  note['image']!, // Extract the image path from the map
              topicName: note['topicName']!,
            );
          },
        ),
      ),
    );
  }
}
