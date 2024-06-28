import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget customContainer(String image, String text) {
  return Stack(
    children: [
      Container(
        height: 145,
        decoration: const BoxDecoration(
          color: AppColors.primary,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: Center(
          child: Container(
            height: 110,
            width: 145,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 102),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
        ),
      ),
    ],
  );
}
