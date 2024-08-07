import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

Widget textBlack14Bold(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 14.sp, color: Colors.black),
  );
}

Widget textWhite12Bold(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.white),
  );
}

Widget textGrey15Bold(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 15.sp, color: Colors.grey[900]),
  );
}

Widget customText(String text, double fs) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.w900, fontSize: fs, color: Colors.white),
  );
}

Widget jobText(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, bottom: 5),
    child: Text(
      text,
      style: const TextStyle(color: Color.fromARGB(255, 116, 116, 116)),
    ),
  );
}

Widget blackText(String textBl) {
  return Text(
    textBl,
    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
  );
}

Widget blueText(String textb) {
  return Text(
    textb,
    style:
        const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700),
  );
}
