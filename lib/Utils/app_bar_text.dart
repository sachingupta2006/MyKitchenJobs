import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

PreferredSizeWidget appBarText() {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 60,
    backgroundColor: AppColors.primary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
    title:const  Text(
      "MY PROFILE",
      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w700),
    ),
  );
}
