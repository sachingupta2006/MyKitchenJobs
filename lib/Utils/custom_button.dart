import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget customButton(String bName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 40,
      width: 320,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          bName,
          style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14),
        ),
      ),
    ),
  );
}
