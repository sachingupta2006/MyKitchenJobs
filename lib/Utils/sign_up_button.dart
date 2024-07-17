import 'package:flutter/material.dart';


Widget signButton(
    double h, double w, Color ccolor, String text, Color scolor, Icon icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child:  Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          color: ccolor,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: scolor, fontWeight: FontWeight.w800, fontSize: 16),
            ),
            icon
          ],
        ),
      ),
    
  );
}
