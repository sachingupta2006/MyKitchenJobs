import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_appbar.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/View/Staff/JobsScreen/job_card.dart';

import 'job_add_screen.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonAppbar(
            back: false,
            title: 'MY JOBS',
            action: GestureDetector(
              onTap: () {
                Get.to(() => const JobAddScreen(),
                    transition: Transition.rightToLeft);
              },
              child: Icon(Icons.add_circle_outline,
                  color: AppColors.white, size: 25.sp),
            ),
          ),
          15.h.height,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const JobsCard(disable: false),
                  15.h.height,
                  const JobsCard(disable: true),
                  15.h.height,
                  const JobsCard(disable: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
