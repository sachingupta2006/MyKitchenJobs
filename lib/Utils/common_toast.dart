import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

commonToast(String msg) {
  return Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.CENTER,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: const Color.fromARGB(255, 231, 226, 226),
    textColor: const Color.fromARGB(255, 0, 0, 0),
    fontSize: 16.0,
  );
}
