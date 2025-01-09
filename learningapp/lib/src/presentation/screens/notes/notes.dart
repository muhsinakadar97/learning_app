import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/theme/colors.dart';
import '../../controllers/notes_controller.dart';
import '../widgets/network_aware.dart';
import 'widgets/custom_listtile.dart';

class Notes extends StatelessWidget {
  final NotesController notesController = Get.put(NotesController());

  Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => notesController.onWillPop(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            'Notes',
            style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.whiteColor,
          automaticallyImplyLeading: false, // Hide the back button
        ),
        body: NetworkAware(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: ListView.builder(
              itemCount: notesController.notesList.length,
              itemBuilder: (context, index) {
                final note = notesController.notesList[index];
                return CustomListTile(
                  pdfImagePath:
                      note['image']!, // Extract the image path from the map
                  topicName:
                      note['topicName']!, // Extract the topic name from the map
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
