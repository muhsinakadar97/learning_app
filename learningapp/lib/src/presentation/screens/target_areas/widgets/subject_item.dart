import 'package:flutter/material.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width - 80,
          decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(width: 2, color: Colors.green),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
