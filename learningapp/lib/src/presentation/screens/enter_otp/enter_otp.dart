import 'package:flutter/material.dart';
import 'package:learningapp/src/presentation/screens/enter_otp/widgets/appbar_title.dart';
import 'package:learningapp/src/presentation/screens/enter_otp/widgets/footer.dart';
import 'package:learningapp/src/presentation/screens/enter_otp/widgets/otp_textfield.dart';
import 'package:learningapp/src/presentation/screens/enter_otp/widgets/resend_note.dart';

class EnterOtp extends StatelessWidget {
  const EnterOtp({super.key});

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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OtpTextfield(),
                    OtpTextfield(),
                    OtpTextfield(),
                    OtpTextfield(),
                    OtpTextfield(),
                    OtpTextfield(),
                  ],
                ),
                ResendNote(),
              ],
            ),
            Footer()
          ],
        ),
      ),
      // body: const SafeArea(child: Text("VerifyNumber")),
    );
  }
}
