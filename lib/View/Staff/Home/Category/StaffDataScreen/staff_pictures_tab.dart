
import 'package:flutter/material.dart';

class StaffPicturesTab extends StatelessWidget {
  const StaffPicturesTab({
    super.key,
    required this.picture,
  });

  final String picture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 0),
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 30, crossAxisSpacing: 30),
        itemBuilder: (context, index) => SizedBox(
          height: 20,
          width: 20,
          child: Image.network(picture),
        ),
      ),
    );
  }
}
