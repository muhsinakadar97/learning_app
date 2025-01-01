import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseListTile extends StatelessWidget {
  const CourseListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: const Color.fromRGBO(96, 125, 139, 1), width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          color: Colors.white,
                          child: Text(
                            "MBBS",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          color: Colors.white,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            "Bachelor of Medicine and a Bachelor of Surgery",
                            style: GoogleFonts.raleway(fontSize: 17),
                          ),
                        ),
                      ),
                      // const Text("Bachelor of Medicine")
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 40,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: const Center(
                child: Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        ),
      ),
    );
  }
}
