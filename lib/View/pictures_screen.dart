import 'package:flutter/material.dart';

class PicturesSreen extends StatelessWidget {
  const PicturesSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (context, index) => Container(
        height: 20,
        width: 20,
        color: const Color.fromARGB(255, 225, 223, 223),
      ),
    );
  }
}
