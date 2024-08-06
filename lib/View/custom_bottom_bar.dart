import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/get_wishlist_list_data_controller.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/View/Staff/HomeScreen/JobsScreen/job_screen.dart';
import 'package:my_kitchen_jobs/View/Staff/HomeScreen/staff_list.dart';
import 'package:my_kitchen_jobs/View/Staff/HomeScreen/JobsScreen/WishlistScreen/ProfileScreen/profile_screen.dart';
import 'package:my_kitchen_jobs/View/Staff/HomeScreen/staff_category_screen.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({super.key});
  final RxInt _currentIndex = 0.obs;
  final GetWishlistDataController getWishlistDataController =
      Get.put(GetWishlistDataController());

  final List<Widget> _pages = [
    const StaffCategoryScreen(),
    const JobScreen(),
    StaffList(
      "",
      "",
    ),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.white,
        body: _pages[_currentIndex.value],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            unselectedLabelStyle: const TextStyle(fontSize: 10),
            selectedLabelStyle: const TextStyle(fontSize: 10),
            items: _buildBottomNavigationBarItems(),
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

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(_currentIndex.value == 0 ? Icons.home : Icons.home_outlined),
        label: "HOME",
      ),
      BottomNavigationBarItem(
        icon: Icon(_currentIndex.value == 1 ? Icons.work : Icons.work_outline),
        label: "JOBS",
      ),
      BottomNavigationBarItem(
        icon: Icon(
            _currentIndex.value == 2 ? Icons.favorite : Icons.favorite_outline),
        label: "WISHLIST",
      ),
      BottomNavigationBarItem(
        icon: Icon(_currentIndex.value == 3
            ? Icons.account_circle
            : Icons.account_circle_outlined),
        label: "PROFILE",
      ),
    ];
  }
}
