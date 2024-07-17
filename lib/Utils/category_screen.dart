import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/blue_text.dart';
import 'package:my_kitchen_jobs/Utils/modal_bottom_sheet.dart';
import 'package:my_kitchen_jobs/Utils/sizebox.dart';
import 'package:my_kitchen_jobs/View/ChefDetailsScreen/chefs_screen.dart';
import 'package:my_kitchen_jobs/View/search_screen.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen(this.texts, this.text, {super.key});

  final String texts;
  final String text;

  // RxList to track the favorite state for each item
  final RxList<bool> _isFavorite = List.generate(10, (index) => false).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.white,
          ),
        ),
        title: Text(
          texts.toUpperCase(),
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        titleSpacing: 0,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => const SearchScreen());
                },
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(left: 15),
                  child: const Icon(
                    Icons.search,
                    color: AppColors.white,
                    size: 28,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  customModal(context);
                },
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(right: 15),
                  child: const Icon(
                    Icons.filter_list_sharp,
                    color: AppColors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          sizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "184 RESULTS FOR $text",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.to(() => const ChefsScreen());
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 210,
                        color: const Color.fromARGB(238, 244, 244, 244),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/chef2.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 10,
                        child: Obx(
                          () => GestureDetector(
                            onTap: () {
                              _isFavorite[index] = !_isFavorite[index];
                            },
                            child: Icon(
                              _isFavorite[index]
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color:
                                  _isFavorite[index] ? Colors.red : Colors.grey,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 55,
                        top: 160,
                        child: Text(
                          "Omkar",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 178,
                        child: blueText("Maharashtra"),
                      ),
                    ],
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
