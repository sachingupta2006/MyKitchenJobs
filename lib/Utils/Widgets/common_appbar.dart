import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/text_style.dart';

class CommonAppbar extends StatelessWidget {
  const CommonAppbar({super.key, required this.title, this.action, this.back});
  final String title;
  final Widget? action;
  final bool? back;
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
          back == false
              ? 0.0.width
              : GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back_ios,
                      color: AppColors.white, size: 25.sp)),
          textWhite20Bold(title),
          const Spacer(),
          action ?? 0.0.width,
        ],
      ),
    );
  }
}
