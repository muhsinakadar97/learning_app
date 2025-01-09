import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/account_setup_controller.dart';

class SubjectItemStrengths extends StatelessWidget {
  final int index;
  const SubjectItemStrengths({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    AccountSetupController accountSetupController =
        Get.find<AccountSetupController>();
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: Obx(
            () => Container(
              height: 80,
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: accountSetupController.strengthSelectedIndex.value ==
                          index
                      ? Border.all(width: 2, color: Colors.green)
                      : Border.all(
                          width: 2,
                          color: const Color.fromRGBO(236, 239, 241, 1)),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/images/physics_logo.jpg',
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: 55,
                                  child: Text(
                                    "Physics",
                                    style: GoogleFonts.raleway(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )),
                              accountSetupController
                                          .strengthSelectedIndex.value ==
                                      index
                                  ? Container(
                                      width: 120,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                        child: Text("5 Topics selected",
                                            style: GoogleFonts.raleway(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  : Container(
                                      width: 120,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 175,
                                  child: Text(
                                    "Tap to select topics",
                                    style: GoogleFonts.raleway(),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                    child: Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
