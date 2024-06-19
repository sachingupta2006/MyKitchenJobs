import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget customButton(String bName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 40,
      width: 110,
      decoration: BoxDecoration(
        gradient:
            const LinearGradient(colors: [AppColors.gsblue, AppColors.gdblue]),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          bName,
          style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              fontSize: 15),
        ),
      ),
    ),
  );
}
