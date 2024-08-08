import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DropDownButtonWidget extends StatelessWidget {
  const DropDownButtonWidget(
      {super.key,
      required this.hintText,
      required this.items,
      required this.selectedValue,
      this.greyColored});
  final String hintText;
  final List<String> items;
  final RxString selectedValue;
  final bool? greyColored;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      color: greyColored == true ? Colors.grey[200] : Colors.white,
      child: Obx(() {
        return DropdownButtonFormField<String>(
          padding: const EdgeInsets.only(left: 10),
          hint: Text(hintText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 14.sp)),
          borderRadius: BorderRadius.zero,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(4), border: InputBorder.none),
          icon: Icon(Icons.arrow_drop_down, size: 30.sp, color: Colors.grey),
          items: items
              .map<DropdownMenuItem<String>>((String value) =>
                  DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14.sp))))
              .toList(),
          value: selectedValue.value.isEmpty ? null : selectedValue.value,
          onChanged: (String? value) {
            selectedValue.value = value ?? '';
          },
        );
      }),
    );
  }
}
