import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/get_wishlist_list_data_controller.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/app_bar_text.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/text_style.dart';

class KitchenEmployeeGrid extends StatelessWidget {
  KitchenEmployeeGrid({super.key});

  final RxList<bool> _isFavorite = List.generate(10, (index) => false).obs;
  // Initialize the GetWishlistDataController
  final GetWishlistDataController GetWishData =
      Get.put(GetWishlistDataController());
  @override
  Widget build(BuildContext context) {
    GetWishData.getWishlistDataApi();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBar("MY WISHLIST"),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Get.to(() =>  ChefsScreen(chefId: sId));
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
                          color: _isFavorite[index] ? Colors.red : Colors.grey,
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
            );
          },
        ),
      ),
    );
  }
}
