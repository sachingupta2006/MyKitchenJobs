import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget blueText(String textb) {
  return Text(
    textb,
    style:
        const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700),
  );
}
