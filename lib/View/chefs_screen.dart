import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/black_text.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/sizebox.dart';
import 'package:my_kitchen_jobs/View/decription_screen.dart';
import 'package:my_kitchen_jobs/View/details_screen.dart';
import 'package:my_kitchen_jobs/View/pictures_screen.dart';

class ChefsScreen extends StatefulWidget {
  const ChefsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChefsScreenState createState() => _ChefsScreenState();
}

class _ChefsScreenState extends State<ChefsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Trigger a rebuild when the tab changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTab(String text, {required bool isSelected}) {
    return Container(
      height: 50,
      color:
          isSelected ? const Color.fromARGB(255, 231, 231, 231) : Colors.white,
      child: Center(
        child: blackText(text),
      ),
    );
  }

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
                      padding: const EdgeInsets.only(right: 300, bottom: 80),
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                  automaticallyImplyLeading: false,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  toolbarHeight: 150,
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
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                customSizeBox(50),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    controller: _tabController,
                    automaticIndicatorColorAdjustment: false,
                    indicator: const BoxDecoration(),
                    indicatorPadding: const EdgeInsets.all(0.8),
                    tabs: [
                      _buildTab("Details",
                          isSelected: _tabController.index == 0),
                      _buildTab("Description",
                          isSelected: _tabController.index == 1),
                      _buildTab("Pictures",
                          isSelected: _tabController.index == 2),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
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
              top: 125, // Adjust the top position as needed
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
