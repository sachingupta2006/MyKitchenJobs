import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/add_wishlist_controller.dart';
import 'package:my_kitchen_jobs/Controllers/get_chefs_controller.dart';
import 'package:my_kitchen_jobs/Controllers/get_chefs_details_controller.dart';
import 'package:my_kitchen_jobs/Utils/KitchenUtils/modal_bottom_sheet.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/text_style.dart';
import 'package:my_kitchen_jobs/View/EmployeeDetails/employee_screen.dart';
import 'package:my_kitchen_jobs/View/EmployeeDetails/employee_search_screen.dart';

class KitchenEmployeeList extends StatelessWidget {
  KitchenEmployeeList(
    this.texts,
    this.text, {
    super.key,
  });

  final String? texts;
  final String? text;
  final AddWishlistController wishlistController =
      Get.put(AddWishlistController());
  final GetChefsController chefsController = Get.put(GetChefsController());
  final RxList<bool> isFavorite = List.generate(10, (index) => false).obs;

  void _toggleFavorite(int index, String chefId) async {
    // Toggle the favorite status
    bool newFavoriteStatus = !isFavorite[index];
    isFavorite[index] = newFavoriteStatus;

    // Call the wishlist API with the updated status
    await wishlistController.wishlistApi(chefId, newFavoriteStatus);

    // Handle any UI updates if needed
  }

  @override
  Widget build(BuildContext context) {
    Get.put(GetChefsDetailsController());
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
          texts!.toUpperCase(),
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
                  Get.to(() => const EmployeeSearchScreen());
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
      body: Obx(() {
        // Handle loading state
        if (chefsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Access the data and handle null cases
        final chefsData = chefsController.chefsData.value;
        if (chefsData == null ||
            chefsData.chefsData == null ||
            chefsData.chefsData!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final chefsList = chefsData.chefsData!;

        // Flatten the list of chefs' data
        final allChefs = chefsList.expand((chef) => chef.data ?? []).toList();

        // Wrap only the parts that need to be reactive
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSizeBox(20, 0),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                " ${allChefs.length} results for $text",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                child: GridView.builder(
                  itemCount: allChefs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final chef = allChefs[index];

                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ChefsScreen(chefId: chef.sId));
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
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    chef.profileImg ??
                                        'https://example.com/default-image.jpg',
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
                                  _toggleFavorite(index, chef.sId);
                                },
                                child: Icon(
                                  isFavorite[index]
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: isFavorite[index]
                                      ? Colors.red
                                      : Colors.grey,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 115),
                            child: Center(child: blackText(chef.name)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 155),
                            child: Center(child: blueText(chef.location.name)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
