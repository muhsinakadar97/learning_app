import 'package:flutter/material.dart';

class SetupTabItem extends StatelessWidget {
  final int index;
  final bool isSelected;

  const SetupTabItem(
      {super.key, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 115,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
    );
  }
}
