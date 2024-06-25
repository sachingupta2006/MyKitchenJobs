import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_bar.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/black_text.dart';
import 'package:my_kitchen_jobs/Utils/blue_text.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/padding.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/sizebox.dart';
import 'package:my_kitchen_jobs/View/decription_screen.dart';
import 'package:my_kitchen_jobs/View/details_screen.dart';
import 'package:my_kitchen_jobs/View/pictures_screen.dart';

class ChefsScreen extends StatelessWidget {
  const ChefsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                AppBar(
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 300, bottom: 100),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.white,
                          )),
                    )
                  ],
                  automaticallyImplyLeading: false,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  toolbarHeight: 200,
                  backgroundColor: AppColors.primary,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "PARESH GHARAT",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "CHEF FROM MAHARASHTRA",
                    style: TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.w700),
                  ),
                ),
                customSizeBox(25),
                TabBar(
                  automaticIndicatorColorAdjustment: false,
                  indicatorPadding: const EdgeInsets.all(0.8),
                  tabs: [
                    Tab(
                      child: blackText("Details"),
                    ),
                    Tab(
                      child: blackText("Description"),
                    ),
                    Tab(
                      child: blackText("Pictures"),
                    )
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      DetailsScreen(),
                      DescriptionScreen(),
                      PicturesSreen(),
                    ],
                  ),
                ),
                sizedBox(),
                customButton("HIRE ME"),
                sizedBox(),
              ],
            ),
            Positioned(
              top: 170, // Adjust the top position as needed
              left: MediaQuery.of(context).size.width / 2 -
                  50, // Center horizontally
              child: ClipOval(
                child: Container(
                  color: Colors
                      .white, // Optional: To add a white border around the image
                  padding: const EdgeInsets.all(
                      4.0), // Optional: To add space between image and border
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/bake.jpg', // Replace with your asset image path
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
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
