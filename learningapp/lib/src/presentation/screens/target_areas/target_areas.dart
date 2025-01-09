import 'package:flutter/material.dart';
import 'package:learningapp/src/presentation/screens/target_areas/widgets/strengths.dart';
import 'package:learningapp/src/presentation/screens/target_areas/widgets/target_areas_submit_button.dart';
import 'package:learningapp/src/presentation/screens/target_areas/widgets/weeknesses.dart';

import 'widgets/header_desc.dart';

class TargetAreas extends StatelessWidget {
  const TargetAreas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: const Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              HeaderDesc(),
              Strengths(),
              Weeknesses(),
              SizedBox(height: 100)
            ],
          ),
        ),
        Positioned(bottom: 20, child: TargetAreasSubmitButton())
      ]),
      // body: const Column(
      //   children: [
      //     SingleChildScrollView(
      //       primary: true,
      //       child: Stack(
      //         children: [
      //           HeaderDesc(),
      //           // Strengths(),
      //           // Weeknesses(),
      //         ],
      //       ),
      //     ),
      //     // Positioned(bottom: 0, child: TargetAreasSubmitButton())
      //   ],
      // ),
    );
  }
}
