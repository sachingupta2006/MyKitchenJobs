import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/square_button.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/switch_modal_sheet.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({super.key});

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
              "Logout and Switch mode",
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
              "Are you sure you want to logout and switch modes? ",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Close the first modal sheet
            },
            child: squareButton(
                15, AppColors.white, "NO, CANCEL", Colors.black, 40, 320),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close the first modal sheet
                Future.delayed(const Duration(milliseconds: 50), () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const SwitchModeModal();
                    },
                  );
                });
              },
              child: Container(
                height: 40,
                width: 320,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: const Center(
                  child: Text(
                    "YES, LOGOUT AND SWITCH",
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
