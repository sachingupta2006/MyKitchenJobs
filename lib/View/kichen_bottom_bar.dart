import 'package:flutter/material.dart';

import 'package:my_kitchen_jobs/Utils/category_screen.dart';
import 'package:my_kitchen_jobs/Utils/container.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/View/JobScreen.dart/job_screen.dart';
import 'package:my_kitchen_jobs/View/ProfileScreen/profile_forgot_password.dart';

import 'package:my_kitchen_jobs/View/kitchen_category_screen.dart';
import 'package:my_kitchen_jobs/View/ProfileScreen/profile_screen.dart';

class KitchenBottomBar extends StatelessWidget {
  KitchenBottomBar({super.key});
  final RxInt _currentIndex = 0.obs;

  final List<Widget> _pages = [
    const KitchenCategoryScreen(),
    const JobScreen(),
    const ProfileScreen(),
    const ProfileForgotPassword()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _pages[_currentIndex.value],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            unselectedLabelStyle: const TextStyle(fontSize: 10),
            selectedLabelStyle: const TextStyle(fontSize: 10),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
              BottomNavigationBarItem(icon: Icon(Icons.work), label: "JOBS"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: "WISHLIST"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: "PROFILE"),
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primary,
            unselectedItemColor: AppColors.white,
            selectedItemColor: AppColors.white,
            currentIndex: _currentIndex.value,
            onTap: (index) => _currentIndex.value = index,
          ),
        ),
      ),
    );
  }
}

Widget name(String title, String image) {
  return GestureDetector(
    onTap: () {
      Get.to(() => CategoryScreen(title), transition: Transition.rightToLeft);
    },
    child: customContainer(image, title),
  );
}
