import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';

import 'package:my_kitchen_jobs/Utils/text_style.dart';
import 'package:my_kitchen_jobs/View/Staff/JobsScreen/job_update_screen.dart';

class JobsList extends StatelessWidget {
  const JobsList({super.key, required this.colors, required this.text});

  final Color colors;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          customSizeBox(20, 0),
          Container(
            height: 100,
            width: 350,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 238, 238, 238),
            ),
            child: Row(
              children: [
                customSizeBox(0, 15),
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/mcl.png"),
                  radius: 38,
                ),
                customSizeBox(0, 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customSizeBox(17, 0),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "MANAGER ",
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text: "AT MAHARASHTRA",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      customSizeBox(2, 0),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Experience: ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                            TextSpan(
                              text: "3 Years",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      customSizeBox(2, 0),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Salary: ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                            TextSpan(
                              text: "15000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 40,
            width: 350,
            color: colors,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customSizeBox(0, 70),
                customText("APPLICANTS", 13),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const JobUpdateScreen(),
                          transition: Transition.rightToLeft);
                    },
                    child: customText("UPDATE", 13)),
                customText(text, 13),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
