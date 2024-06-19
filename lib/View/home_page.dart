import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_kitchen_jobs/Utils/text.dart';
import 'package:my_kitchen_jobs/View/employee_login.dart';
import 'package:my_kitchen_jobs/View/kitchen_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const KitchenCategory(),
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
                    child: customText("FIND KITCHEN STAFF"),
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: BottomSlopeClipper(),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const EmployeeLogin(),
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
                    child: customText(
                      "FIND KITCHEN JOBS",
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