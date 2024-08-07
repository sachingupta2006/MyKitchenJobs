import 'package:flutter/material.dart';

Widget customSizeBox(double ht,double w) {
  return SizedBox(height: ht,width: w,);
}
extension IntExtensions on double? {
  double validate({double value = 0}) {
    return this ?? value;
  }

  Widget get height => SizedBox(height: this?.toDouble());
  Widget get width => SizedBox(width: this?.toDouble());
}