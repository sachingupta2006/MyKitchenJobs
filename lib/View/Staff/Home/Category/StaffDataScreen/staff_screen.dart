import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/common_botton.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/net_image_custom.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/text_style.dart';
import 'package:my_kitchen_jobs/View/Staff/Home/Category/StaffDataScreen/staff_decription_tab.dart';
import 'package:my_kitchen_jobs/View/Staff/Home/Category/StaffDataScreen/staff_pictures_tab.dart';

import '../../../../../Controllers/HomeControllers/StaffControllers/get_staff_details_controller.dart';
import '../../../../../Model/HomeModels/StaffModels/get_staff_details_model.dart';
import 'staff_details_tab.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key, required this.chefId});
  final String chefId;
  @override
  Widget build(BuildContext context) {
    final GetStaffDetailsController getChefC =
        Get.put(GetStaffDetailsController());
    getChefC.getChefApi(chefId);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Obx(() {
        ChefData? chefDetails = getChefC.staffData.value?.chefData;
        return SafeArea(
            bottom: false,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: getChefC.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              staffAppbar(),
                              55.h.height,
                              Expanded(child: staffTabs(chefDetails))
                            ],
                          )),
                staffImage(chefDetails?.profileImg ?? '')
              ],
            ));
      }),
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          color: Colors.white,
          child: SafeArea(child: const CommonButton(text: 'hire me'))),
    );
  }

  Widget staffTabs(ChefData? chefDetails) {
    String designation = '${chefDetails?.position?.firstOrNull}';

    if (chefDetails?.position != null) {
      if (chefDetails!.position!.length > 1) {
        for (var i = 1; i < (chefDetails.position!.length); i++) {
          designation = '$designation/${chefDetails.position?[i]}';
        }
      }
    }
    return Column(
      children: [
        textBlack14Bold('${chefDetails?.name}'.toUpperCase()),
        textPrimary14Bold(
            '$designation from ${chefDetails?.location?.name}'.toUpperCase()),
        20.h.height,
        Expanded(
            child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: EdgeInsets.zero,
                        dividerColor: Colors.transparent,
                        indicator: const BoxDecoration(color: AppColors.grey),
                        padding: EdgeInsets.zero,
                        unselectedLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                        tabs: const [
                          Tab(text: 'Details'),
                          Tab(text: 'Description'),
                          Tab(text: 'Pictures'),
                        ]),
                    10.h.height,
                    Expanded(
                      child: TabBarView(children: [
                        StaffDetailsTab(
                            dob: (chefDetails?.dob.toString() ?? ''),
                            salary: 'Expected salary is about 40,000',
                            experience: 'More than 3 years of experience'),
                        StaffDecriptionTab(
                            description: chefDetails?.about ?? ''),
                        StaffPicturesTab(
                            picture: chefDetails?.dishImages ?? []),
                      ]),
                    )
                  ],
                )))
      ],
    );
  }

  Widget staffImage(String image) {
    return Container(
      padding: EdgeInsets.all(5.h),
      height: 125.h,
      width: 125.h,
      margin: EdgeInsets.only(top: 60.h),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: NetImageCustom(image: image)),
    );
  }

  Widget staffAppbar() {
    return Container(
      height: 140.h,
      padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
      decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back_ios,
                  color: AppColors.white, size: 25.sp)),
          Icon(Icons.favorite_outline, color: Colors.white, size: 25.sp)
        ],
      ),
    );
  }
}
