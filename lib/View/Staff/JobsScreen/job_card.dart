import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

import 'package:my_kitchen_jobs/Utils/text_style.dart';
import 'package:my_kitchen_jobs/View/Staff/JobsScreen/job_add_screen.dart';

class JobsCard extends StatelessWidget {
  const JobsCard({super.key, required this.disable, required this.text});

  final bool disable;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      width: double.infinity,
      color: AppColors.grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 20.h),
                  height: 100.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/images/mcl.png",
                          width: 80.h, height: 80.h, fit: BoxFit.fill)),
                ),
                Container(
                    height: 40.h,
                    color: disable ? Colors.grey[500] : AppColors.primary)
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(5.w, 15.h, 15.w, 20.h),
                    // padding: EdgeInsets.only(bottom: 20.h, left: 15.w),
                    height: 100.h,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'MANAGER ',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold),
                              children: const [
                                TextSpan(
                                    text: "AT MAHARASHTRA",
                                    style: TextStyle(color: Colors.black))
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text.rich(
                            TextSpan(
                              text: "Experience: ",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                              children: const [
                                TextSpan(
                                  text: "3 Years",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text.rich(
                            TextSpan(
                              text: "Salary: ",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                              children: const [
                                TextSpan(
                                  text: "₹ 15000",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
                Container(
                  padding: EdgeInsets.only(left: 5.w, right: 15.w),
                  height: 40.h,
                  width: double.infinity,
                  color: disable ? Colors.grey[500] : AppColors.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWhite13wBold('APPLICANTS'),
                      GestureDetector(
                          onTap: () {
                            Get.to(() => const JobAddScreen(),
                                transition: Transition.rightToLeft);
                          },
                          child: textWhite13wBold('UPDATE')),
                      textWhite13wBold('CLOSE'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
