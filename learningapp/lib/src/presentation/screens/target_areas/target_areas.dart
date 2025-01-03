import 'package:flutter/material.dart';
import 'package:learningapp/src/presentation/screens/target_areas/widgets/header_desc.dart';
import 'package:learningapp/src/presentation/screens/target_areas/widgets/strengths.dart';

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
            // Positioned(top: 20, left: 0, right: 0, child: HeaderDesc()),
            // Strengths(),
            Weeknesses(),
            // Positioned(child: TargetAreasSubmitButton())
          ],
        ),
      ),
    );
  }
}
