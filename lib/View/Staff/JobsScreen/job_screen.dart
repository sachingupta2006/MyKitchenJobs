import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/View/Staff/JobsScreen/job_list.dart';
import 'package:my_kitchen_jobs/View/Staff/JobsScreen/job_add_screen.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF1D84FD),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        title: const Text(
          "MY JOBS",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const JobAddScreen(),
                    transition: Transition.rightToLeft);
              },
              icon: const Icon(
                Icons.add_circle_outline_sharp,
                color: AppColors.white,
              ))
        ],
      ),
      body: const Column(
        children: [
          JobsList(
            colors: AppColors.primary,
            text: "CLOSE",
          ),
          JobsList(
            colors: AppColors.grey,
            text: "REOPEN",
          ),
          JobsList(
            colors: AppColors.grey,
            text: "REOPEN",
          ),
        ],
      ),
    );
  }
}
