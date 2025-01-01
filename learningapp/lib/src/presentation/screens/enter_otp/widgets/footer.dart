import 'package:flutter/material.dart';

import '../../verify_number/widgets/continue_button.dart';
import '../../verify_number/widgets/policy_note.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [PolicyNote(), ContinueButton()],
    );
  }
}
