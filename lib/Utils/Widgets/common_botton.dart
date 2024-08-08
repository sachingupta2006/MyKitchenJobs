import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, this.ontap, required this.text});

  final GestureTapCallback? ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: const Color.fromARGB(255, 220, 220, 226),
            backgroundColor: AppColors.primary,
            shape: LinearBorder.none),
        onPressed: () {
          ontap!();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CommonButtonWhite extends StatelessWidget {
  const CommonButtonWhite({super.key, this.ontap, required this.text});

  final GestureTapCallback? ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: const Color.fromARGB(255, 220, 220, 226),
            backgroundColor: Colors.white,
            shape: LinearBorder.none),
        onPressed: () {
          ontap!();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
