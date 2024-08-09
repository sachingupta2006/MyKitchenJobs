import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/View/Jobs/All%20Jobs/all_job_card.dart';

import '../../Staff/Home/home_appbar.dart';

class AllJobs extends StatelessWidget {
  const AllJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeAppbar(),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              itemCount: 3,
              separatorBuilder: (context, index) => 15.h.height,
              itemBuilder: (context, index) {
                return const AllJobsCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
