import 'package:flutter/material.dart';
import 'package:learningapp/src/presentation/screens/target_course/widgets/submit_button.dart';

import 'widgets/account_desc.dart';
import 'widgets/course_list.dart';

class TargetCourse extends StatelessWidget {
  const TargetCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: const Stack(
        children: [
          // AccountDesc positioned at the top of the screen
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AccountDesc(), // Your Account Description widget
          ),
          // CourseList positioned below the AccountDesc
          Positioned(
            top:
                80, // Adjust this value based on how much space you want for AccountDesc
            left: 0,
            right: 0,
            bottom: 0, // Make it take up the remaining space
            child: CourseList(), // Your list of courses
          ),
          Positioned(bottom: 20, child: AccountSetupSubmitButton())
        ],
      ),
    );
    // body: const Column(
    //   children: [
    //     AccountDesc(),
    //     CourseList(),
    //     SubmitButton()
    //   ],
    // ));
  }
}
