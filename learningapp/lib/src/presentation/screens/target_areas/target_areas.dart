import 'package:flutter/material.dart';

import 'widgets/header_desc.dart';
import 'widgets/strengths.dart';
import 'widgets/weeknesses.dart';

class TargetAreas extends StatelessWidget {
  const TargetAreas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: const SingleChildScrollView(
        primary: true,
        child: Column(
          children: [
            HeaderDesc(),
            Strengths(),
            Weeknesses(),
          ],
        ),
      ),
    );
  }
}
