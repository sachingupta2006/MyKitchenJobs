import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar() {
  return AppBar(
    toolbarHeight: 60,
    automaticallyImplyLeading: false,
    backgroundColor: const Color(0xFF1D84FD),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
    title: Padding(
      padding: const EdgeInsets.only(right: 170),
      child: Image.asset(
        "assets/images/logoblur.jpeg",
      ),
    ),
  );
}
