import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/black_text.dart';
import 'package:my_kitchen_jobs/Utils/blue_text.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          customSizeBox(40, 0),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: blueText("YEAR OF BIRTH:"),
          ),
          customSizeBox(10, 0),
          Padding(
            padding: const EdgeInsets.only(right: 270),
            child: blackText("1969"),
          ),
          customSizeBox(25, 0),
          Padding(
            padding: const EdgeInsets.only(right: 250),
            child: blueText("SALARY:"),
          ),
          customSizeBox(10, 0),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 27),
                child: blackText("Expected Salary is about 40,000"),
              ),
            ],
          ),
          customSizeBox(25, 0),
          Padding(
            padding: const EdgeInsets.only(right: 220),
            child: blueText("EXPERIENCE:"),
          ),
          customSizeBox(10, 0),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 27),
                child: blackText("More than 3 years of Experience"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
