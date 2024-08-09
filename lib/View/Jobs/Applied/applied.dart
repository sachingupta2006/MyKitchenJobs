import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';

import '../../Staff/Home/Category/staff_filter_bottom_sheet.dart';
import '../../Staff/Home/Category/staff_search_screen.dart';
import '../../Staff/Home/home_appbar.dart';
import 'applied_card.dart';

class Applied extends StatelessWidget {
  const Applied({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeAppbar(),
          15.h.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const StaffSearchScreen(),
                        transition: Transition.rightToLeft);
                  },
                  child: Icon(CupertinoIcons.search,
                      color: Colors.black, size: 25.sp),
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(const StaffFilterBottomsheet());
                  },
                  child: Icon(Icons.filter_list_sharp,
                      color: Colors.black, size: 25.sp),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              itemCount: 3,
              separatorBuilder: (context, index) => 15.h.height,
              itemBuilder: (context, index) {
                return const AppliedCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
