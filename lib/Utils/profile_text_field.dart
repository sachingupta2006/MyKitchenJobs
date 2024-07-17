import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget pTextField(String text, {double? he, double? v,TextEditingController? ccontroller}) {
  return Container(
    height: he ?? 50,
    color: AppColors.white,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(controller: ccontroller,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 238, 238, 238),
          filled: true,
          hintText: text,
          hintStyle: const TextStyle(
              color: AppColors.grey, fontSize: 13, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(0),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15, vertical: v ?? 10)),
    ),
  );
}
