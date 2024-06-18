import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget customButton(String bName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        gradient:
            const LinearGradient(colors: [AppColors.gsblue, AppColors.gdblue]),
        borderRadius: BorderRadius.circular(10),
      ),
      child:  Center(
        child: Text(
          bName,
          style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w900,
              fontSize: 20),
        ),
      ),
    ),
  );
}
