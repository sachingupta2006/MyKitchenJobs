import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget bottomNavigationBar() {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
    child: BottomNavigationBar(
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      selectedLabelStyle: const TextStyle(fontSize: 10),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "HOME"),
        BottomNavigationBarItem(
          icon: Icon(Icons.cake),
          label: "JOBS",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: "WISHLIST"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined), label: "PROFILE"),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primary,
      unselectedItemColor: AppColors.white,
      selectedItemColor: AppColors.white,
    ),
  );
}
