import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget customContainer(String image, String text) {
  return Stack(
    children: [
      Container(
        height: 150,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            AppColors.gsblue,
            AppColors.gdblue,
          ]),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Center(
          child: Container(
            height: 110,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: AppColors.white),
          ),
        ),
      ),
    ],
  );
}
