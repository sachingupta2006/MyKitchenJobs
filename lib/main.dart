import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/JobsController/jobs_controller.dart';
import 'package:my_kitchen_jobs/Controllers/home_controller.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

import 'package:my_kitchen_jobs/View/splash_screen.dart';

HomeController homeC = Get.put(HomeController());

void main() {
  Get.put(JobsControllers());
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Kitchen Jobs',
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
