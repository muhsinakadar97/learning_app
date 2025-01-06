import 'package:flutter/material.dart';

import '../../verify_number/widgets/policy_note.dart';
import 'verify_number_continue_button.dart';

class VerifyNumberFooter extends StatelessWidget {
  const VerifyNumberFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [PolicyNote(), VerifyNumberContinueButton()],
    );
  }
}
