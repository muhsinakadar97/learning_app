import 'package:flutter/material.dart';

import '../widgets/network_aware.dart';
import 'widgets/header.dart';
import 'widgets/video_list.dart';

class NextVideo extends StatelessWidget {
  const NextVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkAware(
      child: Column(
        children: [
          NextVideoHeader(),
          VideoList(),
        ],
      ),
    );
  }
}
