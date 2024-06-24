import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget dropDownButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    child: Container(
      color: AppColors.white,
      child: DropdownButtonFormField(
          borderRadius: BorderRadius.zero,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(4),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0))),
          items: <String>[
            "State",
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
                    style: const TextStyle(
                        color: Color.fromARGB(255, 198, 196, 196)),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {}),
    ),
  );
}
