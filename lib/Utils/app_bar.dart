import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_bar_modal_sheet.dart';



PreferredSizeWidget customAppBar(BuildContext ctx) {
  return AppBar(
    toolbarHeight: 60,
    automaticallyImplyLeading: false,
    backgroundColor: const Color(0xFF1D84FD),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
    title: Padding(
      padding: const EdgeInsets.only(right: 100),
      child: Image.asset(
        "assets/images/logoblur.jpeg",
      ),
    ),
    actions: const [
      AppBarModalSheet(),
    ],
  );
}
