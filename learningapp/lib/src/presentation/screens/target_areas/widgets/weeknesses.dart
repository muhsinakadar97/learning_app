import 'package:flutter/material.dart';

import 'subject_item.dart';

class Weeknesses extends StatelessWidget {
  const Weeknesses({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 280,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          width: 10,
        ),
        const Column(
          children: [SubjectItem(), SubjectItem(), SubjectItem()],
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
