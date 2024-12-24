import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/expert_videos_controller.dart';
import '../widgets/network_aware.dart';
import 'widgets/expert_video_list.dart';

class ExpertVideos extends StatelessWidget {
  const ExpertVideos({super.key});

  @override
  Widget build(BuildContext context) {
    ExpertVideosController expertVideosController =
        Get.put(ExpertVideosController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Expert Videos',
            style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false, // Hide the back button
        ),
        body: const NetworkAware(child: ExpertVideoList()));
  }
}
