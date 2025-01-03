import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/src/presentation/controllers/account_setup_controller.dart';
import 'package:learningapp/src/presentation/screens/account_setup/widgets/account_tabbar.dart';

class AccountSetup extends StatelessWidget {
  const AccountSetup({super.key});

  @override
  Widget build(BuildContext context) {
    AccountSetupController accountSetupController =
        Get.put(AccountSetupController());
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
                width: 10,
                height: 50,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.close))),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Setup your account",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Obx(
                      () => Text(
                        accountSetupController.selectedIndex.value == 0
                            ? "Target Course"
                            : accountSetupController.selectedIndex.value == 1
                                ? "Target Areas"
                                : "Target Course",
                        style: GoogleFonts.raleway(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // title: Obx(() => Text(accountSetupController.selectedIndex.value == 0
      //     ? "Target Course"
      //     : accountSetupController.selectedIndex.value == 1
      //         ? "Target Areas"
      //         : "Target Course"))),
      body: const AccountTabbar(),
    );
  }
}
