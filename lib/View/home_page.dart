import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/text.dart';
import 'package:my_kitchen_jobs/View/employee_login.dart';
import 'package:my_kitchen_jobs/View/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> scaleAnimation;
  late AnimationController slideController1;
  late Animation<Offset> slideAnimation1;
  late AnimationController slideController2;
  late Animation<Offset> slideAnimation2;
  final _isWidgetVisible = false.obs;

  @override
  void initState() {
    super.initState();
    // for scaleTransition

    // for slideTransition 1 (right to center)
    slideController1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slideAnimation1 = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(slideController1);

    // for slideTransition 2 (left to center)
    slideController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slideAnimation2 = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(slideController2);

    Timer(const Duration(seconds: 0), () {
      _isWidgetVisible.value = true;
      slideController1.forward();
      slideController2.forward();
    });
  }

  @override
  void dispose() {
    slideController1.dispose();
    slideController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const EmployeeLogin(),
                    transition: Transition.rightToLeft);
              },
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF004AAD),
                      Color(0xFF5DE0E6),
                    ],
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 360),
                    child: SlideTransition(
                        position: slideAnimation1,
                        child: customText("FIND KITCHEN STAFF", 25)),
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: BottomSlopeClipper(),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => KitchenBottomBar(),
                      transition: Transition.rightToLeft);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 43, 235, 29),
                        Color.fromARGB(255, 8, 113, 0),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Obx(
                      () => Visibility(
                        visible: _isWidgetVisible.value,
                        child: SlideTransition(
                          position: slideAnimation2,
                          child: customText(
                            "FIND KITCHEN JOBS",
                            25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Login as chef
//Login as employeer
class BottomSlopeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
