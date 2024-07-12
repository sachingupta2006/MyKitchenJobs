import 'package:flutter/material.dart';

Widget customText(String text,double fs) {
  return Text(
    text,
    style:  TextStyle(
        fontWeight: FontWeight.w900, fontSize: fs, color: Colors.white),
  );
}
