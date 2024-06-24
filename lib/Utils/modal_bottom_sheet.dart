import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/drop_down.dart';
import 'package:my_kitchen_jobs/Utils/sizebox.dart';

Future customModal(BuildContext ctx) {
  return showModalBottomSheet(
    backgroundColor: const Color.fromARGB(255, 230, 230, 230),
    context: ctx,
    builder: (context) => Column(
      children: [
        sizedBox(),
        const Padding(
          padding: EdgeInsets.only(right: 180),
          child: Text(
            "Apply filters",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
        sizedBox(),
        const Divider(
          thickness: 1,
        ),
        sizedBox(),
        dropDownButton(),
        sizedBox(),
        dropDownButton(),
        sizedBox(),
        dropDownButton(),
        sizedBox(),
        customButton("APPLY FILTERS")
      ],
    ),
  );
}
