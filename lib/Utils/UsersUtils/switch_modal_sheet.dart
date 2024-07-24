import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/square_button.dart';

class SwitchModeModal extends StatelessWidget {
  const SwitchModeModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              "Switch mode",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 1),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Are you sure you want to switch modes? ",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Close the second modal sheet
            },
            child: squareButton(
                15, AppColors.white, "NO, CANCEL", Colors.black, 40, 320),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: squareButton(
                15, AppColors.primary, "YES, SWITCH", AppColors.white, 40, 320),
          ),
        ],
      ),
    );
  }
}
