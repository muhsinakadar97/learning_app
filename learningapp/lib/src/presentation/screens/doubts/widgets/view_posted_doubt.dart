import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/colors.dart';
import '../../../controllers/doubts_controller.dart';

class ViewPostedDoubt extends StatelessWidget {
  const ViewPostedDoubt({super.key});

  @override
  Widget build(BuildContext context) {
    DoubtsController doubtsController = Get.find<DoubtsController>();

    return Obx(() => doubtsController.isDoubtEmpty.value
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.circular(10)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "POSTED DOUBT",
                          style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor),
                          overflow: TextOverflow.clip,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // Row(
                        //   children: [
                        //     const SizedBox(
                        //       width: 5,
                        //     ),
                        //     Text(
                        //       doubtsController.doubtText.value,
                        //       style: GoogleFonts.raleway(
                        //           color: AppColors.blueGreyDark),
                        //     ),
                        //     const SizedBox(
                        //       width: 5,
                        //     )
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 5),
                          child: Text(
                            doubtsController.doubtText.value,
                            style: GoogleFonts.raleway(
                                color: AppColors.blackColor, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
        // : SizedBox(
        //     height: 150,
        //     child: SingleChildScrollView(
        //       child: Padding(
        //         padding: const EdgeInsets.only(
        //             left: 20, right: 20, bottom: 40, top: 20),
        //         child: Container(
        //           height: 350,
        //           width: MediaQuery.of(context).size.width,
        //           decoration: BoxDecoration(
        //               color: AppColors.blueGreyLight,
        //               borderRadius: BorderRadius.circular(30)),
        //           child: Padding(
        //             padding:
        //                 const EdgeInsets.only(top: 20, left: 20, right: 20),
        //             child: SingleChildScrollView(
        //               child: Column(
        //                 children: [
        // Text(
        //   "POSTED DOUBT",
        //   style: GoogleFonts.raleway(
        //       fontWeight: FontWeight.bold,
        //       color: AppColors.blueGreyDark),
        //   overflow: TextOverflow.clip,
        // ),
        // const SizedBox(
        //   height: 5,
        // ),
        // Text(
        //   doubtsController.doubtText.value,
        //   style: GoogleFonts.raleway(
        //       color: AppColors.blueGreyDark),
        // )
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   )
        );
  }
}
