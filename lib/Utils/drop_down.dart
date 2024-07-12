import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget dropDownButton(
    String text, Color color, FontWeight fw, Color colors, double fs,{Color? dropcolors}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    child: Container(
      color: color,
      child: DropdownButtonFormField(
          padding: const EdgeInsets.only(left: 10),
          hint: Text(
            text,
            style: TextStyle(fontWeight: fw, color: colors, fontSize: fs),
          ),
          borderRadius: BorderRadius.zero,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(4), border: InputBorder.none),
          icon: Icon(Icons.arrow_drop_down,
              size: 30, color:dropcolors?? AppColors.dgrey),
          items: [
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
