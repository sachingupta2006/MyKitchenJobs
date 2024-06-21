import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_bar.dart';

class IndividualCategory extends StatelessWidget {
  const IndividualCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
    );
  }
}
