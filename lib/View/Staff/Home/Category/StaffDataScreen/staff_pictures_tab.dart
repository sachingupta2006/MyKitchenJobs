import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_kitchen_jobs/Utils/net_image_custom.dart';

class StaffPicturesTab extends StatelessWidget {
  const StaffPicturesTab({
    super.key,
    required this.picture,
  });

  final List<dynamic> picture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: GridView.builder(
        itemCount: picture.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 15.w, crossAxisSpacing: 15.w),
        itemBuilder: (context, index) => NetImageCustom(image: picture[index]),
      ),
    );
  }
}
