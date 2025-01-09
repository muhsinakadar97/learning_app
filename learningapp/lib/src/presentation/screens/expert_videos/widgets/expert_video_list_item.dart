import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/colors.dart';
import '../../../controllers/expert_videos_controller.dart';

// ignore: must_be_immutable
class ExpertVideoListItem extends StatelessWidget {
  int selectedIndex;
  ExpertVideoListItem({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    ExpertVideosController expertVideosController =
        Get.find<ExpertVideosController>();
    return Column(
      children: [
        Container(
          height: 125,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.blueGreyLight,
          ),
          child: Row(
            children: [
              Container(
                width: 180,
                height: 125,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 10, right: 10),
                  child: Container(
                    height: 100,
                    width: 170,
                    decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.play_arrow,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                height: 125,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        expertVideosController.videos[selectedIndex]["title"]!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.indigoColor),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time_rounded,
                                color: AppColors.blackColor,
                                size: 10,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                expertVideosController.videos[selectedIndex]
                                        ["duration"]
                                    .toString(),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              expertVideosController.videos[selectedIndex]
                                      ["date"]
                                  .toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
          // child: Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(10),
          // child: Container(
          //   height: 100,
          //   width: 150,
          //   decoration: BoxDecoration(
          //       color: Colors.black,
          //       borderRadius: BorderRadius.circular(10)),
          //   child: const Icon(
          //     Icons.play_arrow,
          //     color: Colors.white,
          //   ),
          // ),
          //     ),
          //     const SizedBox(width: 20),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: 2, top: 7),
          //           child: Text(

          //             expertVideosController.videos[selectedIndex]["title"]!,
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // style: GoogleFonts.raleway(
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.indigo),
          //           ),
          //         ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Center(
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           const Icon(
          //             Icons.access_time_rounded,
          //             color: Colors.black,
          //             size: 10,
          //           ),
          //           const SizedBox(
          //             width: 4,
          //           ),
          //           Text(
          //             expertVideosController.videos[selectedIndex]
          //                     ["duration"]
          //                 .toString(),
          //             style: const TextStyle(fontSize: 14),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 5,
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 5),
          //         child: Text(
          //           expertVideosController.videos[selectedIndex]["date"]
          //               .toString(),
          //           style: const TextStyle(fontSize: 14),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          //       ],
          //     ),
          //   ],
          // ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
