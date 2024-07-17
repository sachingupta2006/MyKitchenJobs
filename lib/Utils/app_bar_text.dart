import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

PreferredSizeWidget appBar(String text) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back_ios),
      color: AppColors.white,
    ),
    toolbarHeight: 60,
    automaticallyImplyLeading: false,
    backgroundColor: const Color(0xFF1D84FD),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
    title: Text(
      text,
      style:
          const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
    ),
  );
}
