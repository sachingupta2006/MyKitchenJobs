import 'package:flutter/material.dart';

class EmployeeDecriptionScreen extends StatelessWidget {
  const EmployeeDecriptionScreen({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text(
              description,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
