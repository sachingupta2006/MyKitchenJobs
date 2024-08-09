import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/Staff/WishlistControllers/get_wishlist_list_data_controller.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/View/Staff/ProfileScreen/profile.dart';

import 'All Jobs/all_jobs.dart';
import 'Applied/applied.dart';
import 'Pictures/pictures.dart';

class JobsBottomBar extends StatelessWidget {
  JobsBottomBar({super.key});
  final RxInt _currentIndex = 2.obs;
  final GetWishlistDataController getWishlistDataController =
      Get.put(GetWishlistDataController());

  final List<Widget> _pages = [
    const AllJobs(),
    const Applied(),
    const Pictures(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(child: _pages[_currentIndex.value]),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: BottomNavigationBar(
              unselectedLabelStyle:
                  TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
              selectedLabelStyle:
                  TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
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
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(_currentIndex.value == 0 ? Icons.work : Icons.work_outlined),
        label: "ALL JOBS",
      ),
      BottomNavigationBarItem(
        icon: Icon(_currentIndex.value == 1
            ? Icons.check_circle
            : Icons.check_circle_outline),
        label: "APPLIED",
      ),
      BottomNavigationBarItem(
        icon: Icon(_currentIndex.value == 2
            ? Icons.camera_alt
            : Icons.camera_alt_outlined),
        label: "MY PICTURES",
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
