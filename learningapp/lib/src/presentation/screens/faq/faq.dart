import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/faq_controller.dart';
import '../widgets/network_aware.dart';
import 'widgets/faq_list.dart';


class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    FaqController faqController = Get.put(FaqController());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'FAQ',
            style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false, // Hide the back button
        ),
        body: const NetworkAware(child: FaqList()));
  }
}
