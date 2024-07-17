import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/tab_controller.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/sizebox.dart';
import 'package:my_kitchen_jobs/View/ChefDetailsScreen/decription_screen.dart';
import 'package:my_kitchen_jobs/View/ChefDetailsScreen/details_screen.dart';
import 'package:my_kitchen_jobs/View/ChefDetailsScreen/pictures_screen.dart';

class ChefsScreen extends StatefulWidget {
  const ChefsScreen({super.key});

  @override
  State<ChefsScreen> createState() => _ChefsScreenState();
}

class _ChefsScreenState extends State<ChefsScreen>
    with SingleTickerProviderStateMixin {
  final MyTabController tabController = Get.put(MyTabController());
  final RxBool isFavorite = false.obs; // Added for favorite icon state
  late TabController _internalTabController;

  @override
  void initState() {
    super.initState();
    _internalTabController = TabController(length: 3, vsync: this);
    _internalTabController.addListener(() {
      if (_internalTabController.indexIsChanging) {
        tabController.updateIndex(_internalTabController.index);
      }
    });

    _internalTabController.animation?.addListener(() {
      final double value = _internalTabController.animation!.value;
      tabController.updateIndex(value.round());
    });
  }

  @override
  void dispose() {
    _internalTabController.dispose();
    super.dispose();
  }

  Widget _buildTab(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _internalTabController.animateTo(index);
        },
        child: Obx(() {
          bool isSelected = tabController.selectedIndex.value == index;
          return Container(
            height: 60,
            color: isSelected
                ? const Color.fromARGB(255, 240, 240, 240)
                : Colors.transparent,
            child: Center(
                child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w700),
            )),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Column(
            children: [
              AppBar(
                actions: [
                  // Wrap the Row in an Expanded to ensure it doesn't overflow
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Distribute space between children
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.white,
                          ),
                        ),
                        Obx(() {
                          return IconButton(
                            onPressed: () {
                              isFavorite.value = !isFavorite.value;
                            },
                            icon: Icon(
                              isFavorite.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  isFavorite.value ? Colors.red : Colors.white,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
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
              customSizeBox(50, 0),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    _buildTab("Details", 0),
                    _buildTab("Description", 1),
                    _buildTab("Pictures", 2),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _internalTabController,
                  children: const [
                    DetailsScreen(),
                    DescriptionScreen(),
                    PicturesSreen(),
                  ],
                ),
              ),
              sizedBox(),
              customButton("HIRE ME", 0),
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
                    'assets/images/chef1.jpg', // Replace with your asset image path
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
    );
  }
}
