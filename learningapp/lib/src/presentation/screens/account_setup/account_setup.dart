import 'package:flutter/material.dart';
import 'package:learningapp/src/presentation/screens/account_setup/widgets/account_desc.dart';
import 'package:learningapp/src/presentation/screens/account_setup/widgets/appbar_title.dart';
import 'package:learningapp/src/presentation/screens/account_setup/widgets/course_list.dart';
import 'package:learningapp/src/presentation/screens/account_setup/widgets/submit_button.dart';

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
        body: const Column(
          children: [
            AccountDesc(),
            SizedBox(
              height: 20,
            ),
            CourseList(),
            SubmitButton()
          ],
        ));
  }
}
