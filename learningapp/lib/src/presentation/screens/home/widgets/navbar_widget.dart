import 'package:flutter/material.dart';

import '../../../../config/theme/colors.dart';


class NavBarWidget extends StatelessWidget {
  final int pageIndex;
  final Function(int) onPageChanged;

  const NavBarWidget({
    Key? key,
    required this.pageIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        color: AppColors.indigoDark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              onPageChanged(0); // Call the callback to update the page index
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: AppColors.whiteColor,
                    size: 25,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: AppColors.whiteColor,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              onPageChanged(1); // Call the callback to update the page index
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.notes_rounded,
                    color: AppColors.whiteColor,
                    size: 25,
                  )
                : const Icon(
                    Icons.notes_outlined,
                    color: AppColors.whiteColor,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              onPageChanged(2); // Call the callback to update the page index
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.question_answer_rounded,
                    color: AppColors.whiteColor,
                    size: 25,
                  )
                : const Icon(
                    Icons.question_answer_outlined,
                    color: AppColors.whiteColor,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              onPageChanged(3); // Call the callback to update the page index
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.settings_rounded,
                    color: AppColors.whiteColor,
                    size: 25,
                  )
                : const Icon(
                    Icons.settings,
                    color: AppColors.whiteColor,
                    size: 25,
                  ),
          ),
        ],
      ),
    );
  }
}
