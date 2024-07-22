import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget customButton(String bName, double circular) {
  return Container(
      height: 40,
      width: 320,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(circular),
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
    );
  
}
