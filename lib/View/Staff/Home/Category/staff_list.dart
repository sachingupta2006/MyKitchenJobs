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
import 'package:my_kitchen_jobs/View/Staff/Home/Category/StaffDataScreen/staff_screen.dart';
import 'package:my_kitchen_jobs/View/Staff/Home/Category/staff_search_screen.dart';

import '../../../../Model/HomeModels/StaffModels/get_staff_data_model.dart';
import '../../../../Utils/net_image_custom.dart';

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
        ChefsModel? chefsData = chefsController.chefsData.value;
        if (chefsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          List<ChefsData>? chefsList = chefsData?.chefsData;

          List<Data>? allChefs = chefsList?.firstOrNull?.data;
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
                            Get.bottomSheet(const StaffFilterBottomsheet());
                          },
                          child: Icon(Icons.filter_list_sharp,
                              color: AppColors.white, size: 25.sp),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: chefsData == null ||
                              chefsData.chefsData == null ||
                              chefsData.chefsData!.isEmpty
                          ? const Center(child: Text('No data available'))
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                20.h.height,
                                textBlack14Bold(
                                    " ${allChefs?.length} results for $text"),
                                18.h.height,
                                Expanded(
                                  child: GridView.builder(
                                    itemCount: allChefs?.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 15.w,
                                            crossAxisSpacing: 15.w,
                                            mainAxisExtent: 220.h),
                                    itemBuilder: (context, index) {
                                      Data? chef = allChefs?[index];
                                      return Stack(
                                        children: [
                                          resultsCard(chef),
                                          GestureDetector(
                                            onTap: () {
                                              toggleFavorite(
                                                  index, chef?.sId ?? '');
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(15.w),
                                              child: Icon(
                                                  isFavorite[index]
                                                      ? Icons.favorite
                                                      : Icons.favorite_outline,
                                                  color: isFavorite[index]
                                                      ? Colors.red
                                                      : Colors.grey,
                                                  size: 18),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
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

  Widget resultsCard(Data? chef) {
    return GestureDetector(
        onTap: () {
          Get.to(() => StaffScreen(chefId: chef?.sId ?? ''),
              transition: Transition.rightToLeft);
        },
        child: Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                SizedBox(
                    height: 160.h,
                    width: double.infinity,
                    child: NetImageCustom(image: chef?.profileImg ?? '')),
                const Spacer(),
                textBlack14Bold(chef?.name ?? ''),
                4.h.height,
                textPrimary14Bold(chef?.location?.name ?? ''),
                4.h.height
              ],
            )));
  }
}
