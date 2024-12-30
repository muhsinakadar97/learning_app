import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/expert_videos_controller.dart';
import 'expert_video_list_item.dart';

class ExpertVideoList extends StatelessWidget {
  const ExpertVideoList({super.key});

  @override
  Widget build(BuildContext context) {
    ExpertVideosController expertVideosController =
        Get.find<ExpertVideosController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20, right: 20),
        itemCount: expertVideosController.videos.length,
        itemBuilder: (context, index) {
          return ExpertVideoListItem(selectedIndex: index);
        },
      ),
    );
  }
}
