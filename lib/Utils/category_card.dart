import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/gradient_text.dart';
import 'package:my_kitchen_jobs/Utils/individual_category.dart';

Widget categoryCard(String image, String text, String texts) {
  return SizedBox(
    height: 330,
    width: 330,
    child: Card(
      shadowColor: Colors.grey,
      elevation: 6,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const IndividualCategory());
            },
            child: Container(
              height: 220,
              width: 321,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 190),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Center(
                child: GradientText(texts,
                    gradient: const LinearGradient(
                        colors: [AppColors.gsblue, AppColors.gdblue]),
                    style: const TextStyle(fontSize: 15))),
          ),
        ],
      ),
    ),
  );
}
