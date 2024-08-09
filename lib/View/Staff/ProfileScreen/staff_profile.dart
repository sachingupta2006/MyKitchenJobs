import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_bottom_sheet.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_botton.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/text_style.dart';
import 'package:my_kitchen_jobs/main.dart';

import '../../../Utils/app_colors.dart';

class StaffProfile extends StatelessWidget {
  const StaffProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Center(child: textBlack14Bold("LOGIN SUCCESSFULL")),
        const Spacer(),
        CommonButton(
          ontap: () => Get.bottomSheet(logoutBottomsheet()),
          text: 'logout',
        ),
        15.h.height,
      ],
    );
  }

  Widget logoutBottomsheet() {
    return CommonBottomSheet(children: [
      SizedBox(width: double.infinity, height: 25.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: textGrey15Bold('Logout'),
      ),
      Divider(color: AppColors.grey, height: 40.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            textBlack14Bold('Are you sure you want to logout?'),
            40.h.height,
            CommonButtonWhite(
                ontap: () {
                  Get.back();
                },
                text: 'no, cancel'),
            10.h.height,
            CommonButton(
                ontap: () {
                  homeC.setToken('');
                  homeC.logout();
                  Get.back();
                },
                text: 'yes, logout'),
          ],
        ),
      ),
      30.h.height
    ]);
  }
}
