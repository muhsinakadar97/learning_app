import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/colors.dart';

class CustomListTile extends StatelessWidget {
  final String pdfImagePath; // Path to the PDF image
  final String topicName; // Topic name

  const CustomListTile(
      {super.key, required this.pdfImagePath, required this.topicName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: AppColors.blueGrey50,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 7,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              pdfImagePath, // Assuming the image is in your assets
                              width: 50, // Set your desired width
                              height: 50, // Set your desired height
                              fit: BoxFit.cover, // Adjust fit as needed
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: Center(
                              child: Row(
                                children: [
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      topicName,
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.raleway(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const Flexible(
                  flex: 2,
                  child: Center(
                      child: Icon(
                    Icons.download,
                    color: AppColors.blackColor,
                  )),
                ),
              ],
            ),
            // child: Center(
            //   child: ListTile(
            //     title: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            // Image.asset(
            //   pdfImagePath, // Assuming the image is in your assets
            //   width: 50, // Set your desired width
            //   height: 50, // Set your desired height
            //   fit: BoxFit.cover, // Adjust fit as needed
            // ),
            // Text(
            //   topicName,
            //   style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
            // ),
            // const Icon(
            //   Icons.download,
            //   color: Colors.black,
            // ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}
