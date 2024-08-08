import 'package:flutter/material.dart';

class NetImageCustom extends StatelessWidget {
  const NetImageCustom({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.fill,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.image);
      },
    );
  }
}
