import 'package:flutter/material.dart';

Widget squareButton(
  double lef,
  Color ccolor,
  String text,
  Color scolor,
  double h,
  double w,

) {
  return Padding(
    padding:  EdgeInsets.only(left: lef),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          color: ccolor,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: scolor, fontWeight: FontWeight.w800, fontSize: 16),
          ),
        ),
      ),
    ),
  );
}
