import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/View/Staff/HomeScreen/staff_logout_switch__sheet.dart';

class StaffRefreshBottomSheet extends StatelessWidget {
  const StaffRefreshBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return const StaffLogoutSwitchBottom(
              text: "Logout and Switch mode",
              texts: "Are you sure you want to logout and switch modes? ",
              textss: "YES, LOGOUT AND SWITCH",
            );
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
