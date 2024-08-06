import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/square_button.dart';

class StaffLogoutSwitchBottom extends StatelessWidget {
  const StaffLogoutSwitchBottom(
      {super.key,
      required this.text,
      required this.texts,
      required this.textss});

  final String text;
  final String texts;
  final String textss;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 1),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              texts,
              style: const TextStyle(fontWeight: FontWeight.w700),
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
                      return const StaffLogoutSwitchBottom(
                        text: "Switch mode",
                        texts: "Are you sure you want to switch modes? ",
                        textss: "YES, SWITCH",
                      );
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
                child: Center(
                  child: Text(
                    textss,
                    style: const TextStyle(
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
