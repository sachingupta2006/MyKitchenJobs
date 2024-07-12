import 'package:flutter/material.dart';

class PicturesSreen extends StatelessWidget {
  const PicturesSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 0),
      child: GridView.builder(
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 30, crossAxisSpacing: 30),
        itemBuilder: (context, index) => Container(
          height: 20,
          width: 20,
          color: const Color.fromARGB(255, 225, 223, 223),
        ),
      ),
    );
  }
}
