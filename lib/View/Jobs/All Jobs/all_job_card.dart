import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

import 'package:my_kitchen_jobs/Utils/text_style.dart';

class AllJobsCard extends StatelessWidget {
  const AllJobsCard({super.key});

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
                SizedBox(
                  height: 100.h,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 20.h),
                      height: 80.h,
                      width: 80.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/mcl.png'),
                              fit: BoxFit.cover))),
                ),
                Container(height: 40.h, color: AppColors.primary)
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
                  color: AppColors.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      textWhite13wBold('APPLY'),
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
