import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/doubts_controller.dart';
import '../widgets/network_aware.dart';
import 'widgets/doubt_entering_field.dart';
import 'widgets/submit_doubt_button.dart';
import 'widgets/view_posted_doubt.dart';

class Doubts extends StatelessWidget {
  final DoubtsController doubtsController = Get.put(DoubtsController());

  Doubts({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => doubtsController.onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Doubts",
            style: GoogleFonts.raleway(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: const NetworkAware(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoubtEnteringField(),
                  SizedBox(height: 20.0),
                  ViewPostedDoubt(),
                  SubmitDoubtButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
