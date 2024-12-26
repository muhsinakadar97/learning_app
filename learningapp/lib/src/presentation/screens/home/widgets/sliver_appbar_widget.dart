import 'package:flutter/material.dart';

import 'slider_widget.dart';


class SliverAppbarWidget extends StatelessWidget {
  const SliverAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      expandedHeight: 200.0,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: SliderWidget(),
      ),
    );
  }
}
