import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/screens/doubts/widgets/doubt_entering_field.dart';
import 'package:learningapp/src/presentation/screens/doubts/widgets/submit_doubt_button.dart';
import 'package:learningapp/src/presentation/screens/doubts/widgets/view_posted_doubt.dart';

import '../../../config/theme/colors.dart';
import '../../controllers/doubts_controller.dart';

class Doubts extends StatelessWidget {
  final DoubtsController doubtsController = Get.put(DoubtsController());

  Doubts({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => doubtsController.onWillPop(context),
      child: Scaffold(
        resizeToAvoidBottomInset:
            true, // Ensures the view resizes when keyboard is shown
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: Text(
            "Doubts",
            style: GoogleFonts.raleway(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
        ),
        body: const Column(
          children: [
            // This is the scrollable content at the top
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        // color: Colors.amber[50],
                        child: DoubtEnteringField(),
                      ),
                      SizedBox(
                        height: 250,
                        // color: Colors.red[50],
                        child: ViewPostedDoubt(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
              // color: Colors.green[100],
              child: SubmitDoubtButton(),
            ),
          ],
        ),
      ),
    );
  }
}

        // body: const SafeArea(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         Expanded(
        //           child: SingleChildScrollView(
        //             child: Column(
        //               children: [
        //                 SizedBox(
        //                   height: 150,
        //                   child: DoubtEnteringField(),
        //                 ),
        //                 ClearDoubt(),
        //                 SizedBox(
        //                   height: 20,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         ViewPostedDoubt(),
        //         Align(
        //           alignment: Alignment.bottomCenter,
        //           child: SubmitDoubtButton(),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      
