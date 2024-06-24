import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: const Color(0xFF1D84FD),
    shape: const BeveledRectangleBorder(),
    title: Padding(
      padding: const EdgeInsets.only(right: 150),
      child: Image.asset(
        "assets/images/logoblur.jpeg",
      ),
    ),
  );
}
