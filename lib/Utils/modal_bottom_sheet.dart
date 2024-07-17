import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/drop_down.dart';

Future customModal(BuildContext ctx) {
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
          dropDownButton(
            "STATE",
            AppColors.white,
            FontWeight.w500,
            AppColors.dgrey,
            15,
          ),
          const SizedBox(height: 16),
          dropDownButton(
            "PROFESSION",
            AppColors.white,
            FontWeight.w500,
            AppColors.dgrey,
            15,
          ),
          const SizedBox(height: 16),
          dropDownButton(
            "GENDER",
            AppColors.white,
            FontWeight.w500,
            AppColors.dgrey,
            15,
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
