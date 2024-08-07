import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/text_style.dart';
import 'package:my_kitchen_jobs/View/Staff/Home/home_appbar.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/View/Staff/Home/Category/staff_list.dart';

class StaffCategoryScreen extends StatelessWidget {
  const StaffCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeAppbar(),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.w,
                      mainAxisExtent: 143.h,
                      crossAxisSpacing: 15.w),
                  itemBuilder: (context, index) {
                    List cards = [
                      categoryCard("Chefs", "assets/images/chef.jpg", "CHEFS"),
                      categoryCard("Home Cook", "assets/images/banner-03.jpg",
                          "HOME COOK"),
                      categoryCard("Kitchen Helper", "assets/images/bake.jpg",
                          "KITCHEN HELPER"),
                      categoryCard(
                          "Waiter", "assets/images/waiter.jpg", "WAITER"),
                      categoryCard(
                          "Manager", "assets/images/manager.jpg", "MANAGER"),
                      categoryCard("Bartender", "assets/images/bartender.jpg",
                          "BARTENDER"),
                      categoryCard("Housekeeping",
                          "assets/images/banner-05.jpg", "HOUSEKEEPING"),
                      categoryCard("Baking Specialist",
                          "assets/images/baking.jpg", "BAKING SPECIALIST"),
                      categoryCard("Receptionist", "assets/images/recep.jpg",
                          "RECEPTIONIST"),
                    ];
                    return cards[index];
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget categoryCard(String title, String image, String text) {
    return GestureDetector(
        onTap: () {
          Get.to(() => StaffList(title, text),
              transition: Transition.rightToLeft);
        },
        child: Container(
            padding: EdgeInsets.all(5.h),
            color: AppColors.primary,
            child: Column(
              children: [
                SizedBox(
                    height: 105.h,
                    width: double.infinity,
                    child: Image.asset(image, fit: BoxFit.fill)),
                const Spacer(),
                textWhite12Bold(text),
                4.h.height
              ],
            )));
  }
}
