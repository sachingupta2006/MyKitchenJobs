import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffDecriptionTab extends StatelessWidget {
  const StaffDecriptionTab({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Text(
              description,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
