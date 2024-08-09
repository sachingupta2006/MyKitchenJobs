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

Widget textBlack13Bold(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 13.sp, color: Colors.black),
  );
}

Widget textPrimary14Bold(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 14.sp, color: AppColors.primary),
  );
}

Widget textWhite12Bold(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.white),
  );
}

Widget textWhite13wBold(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 13.w, color: Colors.white),
  );
}

Widget textWhite15Bold(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 15.sp, color: Colors.white),
  );
}

Widget textWhite20Bold(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.white),
  );
}

Widget textGrey15Bold(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 15.sp, color: Colors.grey[900]),
  );
}

Widget textGrey13Bold(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 13.sp, color: Colors.grey[700]),
  );
}

Widget customText(String text, double fs) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.w900, fontSize: fs, color: Colors.white),
  );
}
