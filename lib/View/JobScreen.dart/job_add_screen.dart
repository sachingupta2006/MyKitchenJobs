import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_bar_text.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/drop_down.dart';
import 'package:my_kitchen_jobs/Utils/profile_text_field.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';

class JobAddScreen extends StatelessWidget {
  const JobAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBar("ADD JOB"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customSizeBox(30, 0),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    color: AppColors.dgrey,
                    height: 80,
                    width: 80,
                  ),
                ),
                customSizeBox(10, 0),
                dropDownButton(
                  "POSITIONS",
                  const Color.fromARGB(255, 238, 238, 238),
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
                // Increase the height of the address text field
                pTextField("ADDRESS", he: 70, v: 25),
                customSizeBox(200, 0)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {},
                child: customButton("ADD JOB", 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
