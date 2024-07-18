import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

class DropDownButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fw;
  final Color colors;
  final double fs;
  final List<String> items;
  final Color? dropcolors;
  final RxString selectedValue;

  DropDownButtonWidget({
    required this.text,
    required this.color,
    required this.fw,
    required this.colors,
    required this.fs,
    required this.items,
    this.dropcolors,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 50,
        color: color,
        child: Obx(() {
          return DropdownButtonFormField<String>(
            padding: const EdgeInsets.only(left: 10),
            hint: Text(
              text,
              style: TextStyle(
                fontWeight: fw,
                color: colors,
                fontSize: fs,
              ),
            ),
            borderRadius: BorderRadius.zero,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(4),
              border: InputBorder.none,
            ),
            icon: Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: dropcolors ?? AppColors.dgrey,
            ),
            items: items.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: AppColors.dgrey),
                  ),
                );
              },
            ).toList(),
            value: selectedValue.value.isEmpty ? null : selectedValue.value,
            onChanged: (String? value) {
              selectedValue.value = value ?? '';
            },
          );
        }),
      ),
    );
  }
}
