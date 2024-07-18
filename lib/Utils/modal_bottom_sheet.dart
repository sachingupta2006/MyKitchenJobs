import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/dropdown_controller.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/drop_down.dart';

Future customModal(BuildContext ctx) {
  final DropdownController dropdownController = Get.put(DropdownController());

  return showModalBottomSheet(
    context: ctx,
    builder: (context) => Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              "Apply filters",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 1),
          const SizedBox(height: 16),
          DropDownButtonWidget(
            text: "STATE",
            color: AppColors.white,
            fw: FontWeight.w500,
            colors: AppColors.dgrey,
            fs: 15,
            items: [
              "Maharashtra",
              "Uttar Pradesh",
              "Andhra Pradesh",
              "Jammu and Kashmir",
            ],
            dropcolors: AppColors.dgrey,
            selectedValue: dropdownController.selectedState,
          ),
          const SizedBox(height: 16),
          DropDownButtonWidget(
            text: "PROFESSION",
            color: AppColors.white,
            fw: FontWeight.w500,
            colors: AppColors.dgrey,
            fs: 15,
            items: [
              "Chef",
              "Bartender",
            ],
            dropcolors: AppColors.dgrey,
            selectedValue: dropdownController.selectedProfession,
          ),
          const SizedBox(height: 16),
          DropDownButtonWidget(
            text: "GENDER",
            color: AppColors.white,
            fw: FontWeight.w500,
            colors: AppColors.dgrey,
            fs: 15,
            items: [
              "Male",
              "Female",
              "Others",
            ],
            dropcolors: AppColors.dgrey,
            selectedValue: dropdownController.selectedGender,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: customButton("APPLY FILTERS", 0),
          ),
        ],
      ),
    ),
  );
}
