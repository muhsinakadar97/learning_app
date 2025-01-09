import 'package:flutter/material.dart';
import 'package:learningapp/src/presentation/screens/account_created/widgets/account_created_msg.dart';
import 'package:learningapp/src/presentation/screens/account_created/widgets/submit_button.dart';
import 'package:learningapp/src/presentation/screens/account_created/widgets/tick_widget.dart';

class AccountCreated extends StatelessWidget {
  const AccountCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TickWidget(),
                    SizedBox(
                      height: 50,
                    ),
                    AccountCreatedMsg()
                  ],
                ),
              ),
            ),
            AccountCreatedContinueButton(),
          ],
        ),
      ),
    );
  }
}
