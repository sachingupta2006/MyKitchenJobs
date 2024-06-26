import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/drop_down.dart';

Future customModal(BuildContext ctx) {
  return showModalBottomSheet(
    backgroundColor: AppColors.lgrey,
    context: ctx,
    builder: (context) => Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensure minimum height necessary
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
          dropDownButton("STATE"),
          const SizedBox(height: 16),
          dropDownButton("PROFESSION"),
          const SizedBox(height: 16),
          dropDownButton("GENDER"),
          const SizedBox(height: 15), // Increased spacing for apply button
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: customButton("APPLY FILTERS"),
          ),
        ],
      ),
    ),
  );
}
