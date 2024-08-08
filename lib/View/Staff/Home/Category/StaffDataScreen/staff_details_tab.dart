import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart'; 
import 'package:my_kitchen_jobs/Utils/text_style.dart';

class StaffDetailsTab extends StatelessWidget {
  const StaffDetailsTab({
    super.key,
    required this.dob,
    required this.salary,
    required this.experience,
  });

  final String dob;
  final String salary;
  final String experience;

  String formatDate(String dob) {
    final DateTime? parsedDate = DateTime.tryParse(dob);
    // final String formattedDate = DateFormat.y().format(parsedDate);
    return parsedDate != null ? parsedDate.toString().substring(0, 4) : '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textPrimary14Bold("YEAR OF BIRTH:"),
          5.h.height,
          textBlack13Bold(formatDate(dob)),
          25.h.height,
          textPrimary14Bold("SALARY:"),
          5.h.height,
          textBlack13Bold(salary),
          25.h.height,
          textPrimary14Bold("EXPERIENCE:"),
          5.h.height,
          textBlack13Bold(experience),
        ],
      ),
    );
  }
}
