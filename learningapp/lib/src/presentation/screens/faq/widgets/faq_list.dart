import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/colors.dart';
import '../../../controllers/faq_controller.dart';

class FaqList extends StatelessWidget {
  const FaqList({super.key});

  @override
  Widget build(BuildContext context) {
    FaqController faqController = Get.find<FaqController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: faqController.faqList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () {
                faqController.toggleExpansion(index);
              },
              child: Obx(() => Container(
                    width: MediaQuery.of(context).size.width - 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.blueGreyLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  faqController.faqList[index]["question"]!,
                                  style: GoogleFonts.raleway(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.blackColor,
                            )
                          ],
                        ),
                        // Show answer only if the item is expanded
                        faqController.isExpandedList[index]
                            ? Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        faqController.faqList[index]["answer"]!,
                                        style:
                                            GoogleFonts.raleway(fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
