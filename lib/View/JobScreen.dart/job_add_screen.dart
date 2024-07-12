import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_bar_job.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/drop_down.dart';
import 'package:my_kitchen_jobs/Utils/profile_text_field.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/View/JobScreen.dart/job_update_screen.dart';

class JobAddScreen extends StatelessWidget {
  const JobAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appbarJob("ADD JOB"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSizeBox(15, 0),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              color: AppColors.dgrey,
              height: 80,
              width: 80,
            ),
          ),
          customSizeBox(10, 0),
          dropDownButton(
            "POSITIONS",
          const  Color.fromARGB(255, 238, 238, 238),
            FontWeight.w500,
            AppColors.grey,
            13,
          ),
          customSizeBox(10, 0),
          dropDownButton(
            "GENDER",
            const Color.fromARGB(255, 238, 238, 238),
            FontWeight.w500,
            AppColors.grey,
            13,
          ),
          customSizeBox(10, 0),
          dropDownButton(
            "STATES",
            const Color.fromARGB(255, 238, 238, 238),
            FontWeight.w500,
            AppColors.grey,
            13,
          ),
          customSizeBox(10, 0),
          pTextField("EXPERIENCE"),
          customSizeBox(10, 0),
          pTextField("SALARY"),
          customSizeBox(10, 0),
          pTextField("ADDRESS"),
          customSizeBox(170, 0),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: GestureDetector(
                onTap: () {
                  Get.to(() =>const JobUpdateScreen());
                },
                child: customButton("ADD JOB", 0)),
          ),
        ],
      ),
    );
  }
}
