import 'package:flutter/material.dart';
import 'package:learningapp/src/presentation/screens/verify_number/widgets/appbar_title.dart';
import 'package:learningapp/src/presentation/screens/verify_number/widgets/verify_number_footer.dart';

import 'widgets/name_textfield.dart';

class YourName extends StatelessWidget {
  const YourName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const AppbarTitle(),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NameTextfield(),
            VerifyNumberFooter(),
          ],
        ),
      ),
      // body: const SafeArea(child: Text("VerifyNumber")),
    );
  }
}
