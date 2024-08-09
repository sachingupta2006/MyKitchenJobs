import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_botton.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_bottom_sheet.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_drop_down.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';

import '../../../../Controllers/Staff/dropdown_controller.dart';
import '../../../../Utils/text_style.dart';

class StaffFilterBottomsheet extends StatelessWidget {
  const StaffFilterBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final DropdownController dropdownC = Get.put(DropdownController());

    return CommonBottomSheet(
      children: [
        SizedBox(width: double.infinity, height: 25.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: textGrey15Bold('Apply filters'),
        ),
        Divider(color: AppColors.grey, height: 40.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              DropDownButtonWidget(
                hintText: "STATE",
                items: const [
                  "Maharashtra",
                  "Uttar Pradesh",
                  "Andhra Pradesh",
                  "Jammu and Kashmir",
                ],
                selectedValue: dropdownC.selectedState,
              ),
              10.h.height,
              DropDownButtonWidget(
                hintText: "PROFESSION",
                items: const [
                  "Chef",
                  "Bartender",
                ],
                selectedValue: dropdownC.selectedProfession,
              ),
              10.h.height,
              DropDownButtonWidget(
                hintText: "GENDER",
                items: const [
                  "Male",
                  "Female",
                  "Others",
                ],
                selectedValue: dropdownC.selectedGender,
              ),
              10.h.height,
              CommonButton(
                  ontap: () {
                    Get.back();
                  },
                  text: 'Apply filters'),
            ],
          ),
        ),
        20.h.height,
      ],
    );
  }
}
