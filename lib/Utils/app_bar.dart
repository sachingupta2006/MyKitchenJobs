import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: const Color(0xFF1D84FD),
    title: Padding(
      padding: const EdgeInsets.only(right: 120),
      child: Image.asset(
        "assets/images/logoblur.jpeg",
      ),
    ),
  );
}
