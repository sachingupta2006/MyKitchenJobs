import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_bar_text.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/profile_text_field.dart';
import 'package:my_kitchen_jobs/Utils/sign_up_button.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/square_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBarText(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "LOGIN TO CONTINUE",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          pTextField("Email"),
          customSizeBox(10, 0),
          pTextField("Password"),
          customSizeBox(10, 0),
          const Padding(
            padding: EdgeInsets.only(left: 175),
            child: Text(
              "Forgot your password?",
              style: TextStyle(
                  color: AppColors.primary, fontWeight: FontWeight.w700),
            ),
          ),
          customSizeBox(25, 0),
          Row(
            children: [
              GestureDetector(
                child: squareButton(
                    15, AppColors.primary, "LOGIN", AppColors.white, 50, 120),
              ),
              GestureDetector(
                onTap: () {},
                child: signButton(
                    50,
                    120,
                    AppColors.primary,
                    "SIGN UP",
                    AppColors.white,
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColors.white,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
