import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget pTextField(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 238, 238, 238),
          filled: true,
          hintText: text,
          hintStyle:const TextStyle(
              color: AppColors.grey, fontSize: 13, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
    ),
  );
}
