import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/doubts_controller.dart';

class DoubtEnteringField extends StatelessWidget {
  const DoubtEnteringField({super.key});

  @override
  Widget build(BuildContext context) {
    DoubtsController doubtsController = Get.find<DoubtsController>();
    return Flexible(
      child: SingleChildScrollView(
        // Wrap the Container in SingleChildScrollView
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            minLines: null,
            maxLines: null,
            cursorColor: Colors.blueGrey[900],
            expands: true,
            keyboardType: TextInputType.multiline,
            controller: doubtsController.doubtTextController,
            decoration: InputDecoration(
              hintText: 'Ask your doubts here...',
              hintStyle: TextStyle(color: Colors.blueGrey[100]),
              counterText: "",
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromRGBO(38, 50, 56, 1), width: 2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(38, 50, 56, 1)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
            ),
            style: GoogleFonts.raleway(),
          ),
        ),
      ),
    );
  }
}
