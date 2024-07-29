import 'package:flutter/material.dart';

Widget squareButton(
    double lef, Color ccolor, String text, Color scolor, double h, double w,
    {Icon? icon}) {
  return Padding(
    padding: EdgeInsets.only(left: lef),
    child: Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        color: ccolor,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(
        child: icon == null
            ? Text(
                text,
                style: TextStyle(
                    color: scolor, fontWeight: FontWeight.w800, fontSize: 16),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(width: 8), // Space between icon and text
                  Text(
                    text,
                    style: TextStyle(
                        color: scolor,
                        fontWeight: FontWeight.w800,
                        fontSize: 16),
                  ),
                ],
              ),
      ),
    ),
  );
}
