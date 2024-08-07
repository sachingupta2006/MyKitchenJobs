import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/WishlistControllers/add_wishlist_controller.dart';
import 'package:my_kitchen_jobs/Controllers/HomeControllers/StaffControllers/get_staff_controller.dart';
import 'package:my_kitchen_jobs/Controllers/HomeControllers/StaffControllers/get_staff_details_controller.dart';
import 'package:my_kitchen_jobs/Utils/common_appbar.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/View/Staff/Home/Category/staff_filter_bottom_sheet.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/text_style.dart';
import 'package:my_kitchen_jobs/View/Staff/Home/Category/StaffDataScreen/staff_data.dart';
import 'package:my_kitchen_jobs/View/Staff/Home/Category/staff_search_screen.dart';

class StaffList extends StatelessWidget {
  const StaffList(this.texts, this.text, {super.key});

  final String? texts;
  final String? text;
  @override
  Widget build(BuildContext context) {
    final AddWishlistController wishlistController =
        Get.put(AddWishlistController());
    final GetStaffController chefsController = Get.put(GetStaffController());
    final RxList<bool> isFavorite = List.generate(10, (index) => false).obs;

    void toggleFavorite(int index, String chefId) async {
      // Toggle the favorite status
      bool newFavoriteStatus = !isFavorite[index];
      isFavorite[index] = newFavoriteStatus;

      // Call the wishlist API with the updated status
      await wishlistController.wishlistApi(chefId, newFavoriteStatus);

      // Handle any UI updates if needed
    }

    Get.put(GetStaffDetailsController());
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Obx(() {
        final chefsData = chefsController.chefsData.value;
        if (chefsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (chefsData == null ||
            chefsData.chefsData == null ||
            chefsData.chefsData!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          final chefsList = chefsData.chefsData!;

          final allChefs = chefsList.expand((chef) => chef.data ?? []).toList();
          return SafeArea(
            bottom: false,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonAppbar(
                    title: text ?? '',
                    action: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const StaffSearchScreen());
                          },
                          child: Icon(CupertinoIcons.search,
                              color: AppColors.white, size: 25.sp),
                        ),
                        GestureDetector(
                          onTap: () {
                            staffFilterBottomSheet(context);
                          },
                          child: Icon(Icons.filter_list_sharp,
                              color: AppColors.white, size: 25.sp),
                        )
                      ],
                    ),
                  ),
                  20.h.height,
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
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 20),
                      child: GridView.builder(
                        itemCount: allChefs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          final chef = allChefs[index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(() => StaffScreen(chefId: chef.sId));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 210,
                                  color:
                                      const Color.fromARGB(238, 244, 244, 244),
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
                                        toggleFavorite(index, chef.sId);
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
                                  child: Center(
                                      child: blueText(chef.location.name)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
