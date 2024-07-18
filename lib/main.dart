import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/home_controller.dart';

import 'package:my_kitchen_jobs/View/splash_screen.dart';


HomeController homeC = Get.put(HomeController());


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kitchen Jobs',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(0, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
