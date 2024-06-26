import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/blue_text.dart';
import 'package:my_kitchen_jobs/Utils/modal_bottom_sheet.dart';
import 'package:my_kitchen_jobs/Utils/sizebox.dart';
import 'package:my_kitchen_jobs/View/chefs_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(this.texts, {super.key});

  final String texts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.primary,
        actions: [
          Expanded(
            child: Row(
              children: [
                Row(
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
                    Text(
                      texts,
                      style: const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                  padding: const EdgeInsets.only(left: 20),
                  constraints: const BoxConstraints(),
                  color: AppColors.white,
                  onPressed: () {},
                  iconSize: 28,
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  padding: const EdgeInsets.only(right: 20),
                  constraints: const BoxConstraints(),
                  color: AppColors.white,
                  onPressed: () {
                    customModal(context);
                  },
                  iconSize: 28,
                  icon: const Icon(Icons.filter_list_sharp),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          sizedBox(),
          const Padding(
            padding: EdgeInsets.only(right: 170),
            child: Text(
              "184 RESULTS FOR CHEF ",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 0,
                    childAspectRatio: 0.8),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.to(() => const ChefsScreen());
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 150,
                        color: const Color.fromARGB(238, 244, 244, 244),
                      ),
                      Positioned(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/chef1.jpg",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 55,
                        top: 160,
                        child: Text(
                          "Omkar",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ),
                      Positioned(
                          left: 30, top: 180, child: blueText("Maharashtra"))
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
