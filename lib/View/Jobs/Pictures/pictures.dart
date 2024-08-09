import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_botton.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';

import '../../Staff/Home/home_appbar.dart';

class Pictures extends StatelessWidget {
  const Pictures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeAppbar(),
          15.h.height,
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.w,
                  mainAxisExtent: Get.width / 2 + 4.w,
                  crossAxisSpacing: 15.w),
              itemBuilder: (context, index) {
                List cards = [
                  categoryCard("assets/images/chef.jpg"),
                  categoryCard("assets/images/banner-03.jpg"),
                  categoryCard("assets/images/bake.jpg"),
                  categoryCard("assets/images/waiter.jpg"),
                  categoryCard("assets/images/manager.jpg"),
                  categoryCard("assets/images/bartender.jpg"),
                  categoryCard("assets/images/banner-05.jpg"),
                  categoryCard("assets/images/baking.jpg"),
                  categoryCard("assets/images/recep.jpg"),
                ];
                return cards[index];
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(15.w,5.h,15.w,10.h),
        child: const CommonButton(text: 'add more'),
      ),
    );
  }

  Widget categoryCard(String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            height: Get.width / 2 - 22.5.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover))),
        Container(
          padding: EdgeInsets.all(3.w),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100)),
              color: AppColors.primary),
          child: Icon(Icons.delete_forever_outlined,
              color: Colors.white, size: 20.sp),
        )
      ],
    );
  }
}
