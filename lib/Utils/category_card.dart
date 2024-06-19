import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget categoryCard() {
  return Container(
    height: 340,
    width: 340,
    child: Card(
      color: AppColors.white,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bartender.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 190),
            child: Center(
              child: Text(
                "AAKASH",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Center(
              child: Text(
                "Receptionist and Chef",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
