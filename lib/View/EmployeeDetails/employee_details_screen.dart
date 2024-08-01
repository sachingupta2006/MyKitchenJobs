import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/text_style.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  const EmployeeDetailsScreen({
    super.key,
    required this.dob,
    required this.salary,
    required this.experience,
  });

  final String dob;
  final String salary;
  final String experience;

  String formatDate(String dob) {
    final DateTime parsedDate = DateFormat('yyyy').parse(dob);
    final String formattedDate = DateFormat.y().format(parsedDate);
    return formattedDate;
  }

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
            child: blackText(formatDate(dob)),
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
                child: blackText(salary),
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
                child: blackText(experience),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
