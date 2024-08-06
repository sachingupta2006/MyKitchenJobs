import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.icon,
    this.labeltext,
    this.obscure, {
    required this.controllers,
    required this.hinttext,
    super.key,
  });

  final TextEditingController controllers;
  final String hinttext;
  final Widget? icon;
  final String labeltext;
  final bool? obscure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: obscure!,
        obscuringCharacter: "*",
        maxLength: 50,
        controller: controllers,
        decoration: InputDecoration(
          hintText: hinttext,
          suffixIcon: icon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          label: Text(
            labeltext,
            style: const TextStyle(color: AppColors.primary),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
