import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/View/Staff/HomeScreen/StaffScreen/StaffCategoryScreen/app_bar.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/View/Staff/HomeScreen/StaffScreen/StaffCategoryScreen/StaffListScreen/staff_list.dart';


class StaffCategoryScreen extends StatelessWidget {
  const StaffCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 18,
          childAspectRatio: 1,
          children: [
            name("Chefs", "assets/images/chef.jpg", "CHEFS"),
            name("Home Cook", "assets/images/banner-03.jpg", "HOME COOK"),
            name("Kitchen Helper", "assets/images/bake.jpg", "KITCHEN HELPER"),
            name("Waiter", "assets/images/waiter.jpg", "WAITER"),
            name("Manager", "assets/images/manager.jpg", "MANAGER"),
            name("Bartender", "assets/images/bartender.jpg", "BARTENDER"),
            name("Housekeeping", "assets/images/banner-05.jpg", "HOUSEKEEPING"),
            name("Baking Specialist", "assets/images/baking.jpg",
                "BAKING SPECIALIST"),
            name("Receptionist", "assets/images/recep.jpg", "RECEPTIONIST"),
          ],
        ),
      ),
    );
  }
}

Widget name(String title, String image, String text) {
  return GestureDetector(
    onTap: () {
      Get.to(
          () => StaffList(
                title,
                text,
              ),
          transition: Transition.rightToLeft);
    },
    child: staffCommonContainer(image, title),
  );
}

Widget staffCommonContainer(String image, String text) {
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
