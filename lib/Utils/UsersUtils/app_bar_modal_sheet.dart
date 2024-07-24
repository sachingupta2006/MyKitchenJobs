import 'package:flutter/material.dart';

import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/logout_modal_sheet.dart';

class AppBarModalSheet extends StatelessWidget {
  const AppBarModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return const LogoutModal();
          },
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Icon(
          Icons.refresh,
          color: AppColors.white,
        ),
      ),
    );
  }
}
