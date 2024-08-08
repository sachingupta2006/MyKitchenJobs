import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_bottom_sheet.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/View/home_page.dart';
import 'package:my_kitchen_jobs/main.dart';

import '../../../Utils/Widgets/common_botton.dart';
import '../../../Utils/text_style.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 20.h),
      decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/logoblur.jpeg", height: 30.h),
          GestureDetector(
            onTap: () {
              print('token:${homeC.token}');
              Get.bottomSheet(homeC.token == null
                  ? switchBottomsheet()
                  : logoutBottomsheet());
            },
            child: Icon(Icons.refresh, color: AppColors.white, size: 25.sp),
          )
        ],
      ),
    );
  }

  Widget logoutBottomsheet() {
    return CommonBottomSheet(children: [
      SizedBox(width: double.infinity, height: 25.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: textGrey15Bold('Logout and switch mode'),
      ),
      Divider(color: AppColors.grey, height: 40.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            textBlack14Bold(
                'Are you sure you want to logout and switch modes?'),
            40.h.height,
            CommonButtonWhite(
                ontap: () {
                  Get.back();
                },
                text: 'no, cancel'),
            10.h.height,
            CommonButton(
                ontap: () {
                  Get.offAll(() => const HomePage(),
                      transition: Transition.rightToLeft);
                  homeC.logout();
                },
                text: 'yes, logout and switch'),
          ],
        ),
      ),
      30.h.height
    ]);
  }

  Widget switchBottomsheet() {
    return CommonBottomSheet(children: [
      SizedBox(width: double.infinity, height: 25.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: textGrey15Bold('Switch mode'),
      ),
      Divider(color: AppColors.grey, height: 40.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            textBlack14Bold('Are you sure you want to switch modes?'),
            40.h.height,
            CommonButtonWhite(
                ontap: () {
                  Get.back();
                },
                text: 'no, cancel'),
            10.h.height,
            CommonButton(
                ontap: () {
                  Get.offAll(() => const HomePage(),
                      transition: Transition.rightToLeft);
                },
                text: 'yes, switch'),
          ],
        ),
      ),
      30.h.height
    ]);
  }
}
