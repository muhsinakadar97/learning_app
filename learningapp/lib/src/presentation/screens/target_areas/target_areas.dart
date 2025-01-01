import 'package:flutter/material.dart';
import 'package:learningapp/src/presentation/screens/target_areas/widgets/appbar_title.dart';

import 'widgets/header_desc.dart';
import 'widgets/strengths.dart';
import 'widgets/weeknesses.dart';

class TargetAreas extends StatelessWidget {
  const TargetAreas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const AppbarTitle(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 4,
                color: Colors.black,
              ),
            ),
            const HeaderDesc(),
            const Strengths(),
            const Weeknesses(),
            const Strengths()
          ],
        ),
      ),
    );
  }
}
