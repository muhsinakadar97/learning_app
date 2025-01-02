import 'package:flutter/material.dart';
import 'package:learningapp/src/presentation/screens/account_setup/widgets/appbar_title.dart';
import 'package:learningapp/src/presentation/screens/account_setup/widgets/submit_button.dart';

import 'widgets/account_desc.dart';
import 'widgets/course_list.dart';

class AccountSetup extends StatelessWidget {
  const AccountSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: const AppbarTitle()),
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
                110, // Adjust this value based on how much space you want for AccountDesc
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
