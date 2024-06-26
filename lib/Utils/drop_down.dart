import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget dropDownButton(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    child: Container(
      color: AppColors.white,
      child: DropdownButtonFormField(
          padding: const EdgeInsets.only(left: 10),
          hint: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: AppColors.dgrey),
          ),
          borderRadius: BorderRadius.zero,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(4), border: InputBorder.none),
          icon: const Icon(Icons.arrow_drop_down,
              size: 30, color: AppColors.dgrey),
          items: <String>[
            "Maharashtra",
            "Uttar Pradesh",
            "Andhra Pradesh",
            "Jammu and Kashmir",
          ]
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: AppColors.dgrey),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {}),
    ),
  );
}
