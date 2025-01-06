import 'package:flutter/material.dart';

import 'enter_otp_continue_button.dart';
import '../../verify_number/widgets/policy_note.dart';

class EnterOtpFooter extends StatelessWidget {
  const EnterOtpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [PolicyNote(), EnterOtpContinueButton()],
    );
  }
}
