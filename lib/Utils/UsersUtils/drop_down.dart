import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DropDownButtonWidget extends StatelessWidget {
  const DropDownButtonWidget({
    super.key,
    required this.text,
    required this.items,
    required this.selectedValue,
  });
  final String text;
  final List<String> items;
  final RxString selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      color: Colors.white,
      child: Obx(() {
        return DropdownButtonFormField<String>(
          padding: const EdgeInsets.only(left: 10),
          hint: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 15.sp),
          ),
          borderRadius: BorderRadius.zero,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(4),
            border: InputBorder.none,
          ),
          icon: Icon(Icons.arrow_drop_down, size: 30.sp, color: Colors.grey),
          items: items.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15.sp),
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
    );
  }
}
