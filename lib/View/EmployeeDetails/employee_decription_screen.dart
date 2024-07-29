import 'package:flutter/material.dart';

class EmployeeDecriptionScreen extends StatelessWidget {
  const EmployeeDecriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(40),
            child: Text(
              'A chef is a skilled culinary professional who specializes in preparing and creating a wide range of dishes, from everyday meals to gourmet feasts.range of dishes, from everyday meals to gourmet feasts.range of dishes, from everyday meals to gourmet feasts.range of dishes, from everyday meals to gourmet feasts.range of dishes, from everyday meals to gourmet feasts.range of dishes, from everyday meals to gourmet feasts.range of dishes, from everyday meals to gourmet feasts.range of dishes, from everyday meals to \ngourmet feasts.range of dishes, from everyday meals to gourmet feasts.',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
