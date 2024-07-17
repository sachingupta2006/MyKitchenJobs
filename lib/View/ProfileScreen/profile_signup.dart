import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_bar_text.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/drop_down.dart';
import 'package:my_kitchen_jobs/Utils/profile_text_field.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/square_button.dart';
import 'package:my_kitchen_jobs/Utils/sign_up_button.dart';

class ProfileSignup extends StatelessWidget {
  const ProfileSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.white,
        appBar: appBar("MY PROFILE"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customSizeBox(40, 0),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  "SIGN UP TO CONTINUE",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              pTextField("Name"),
              customSizeBox(10, 0),
              pTextField("Email"),
              customSizeBox(10, 0),
              pTextField("Phone number"),
              customSizeBox(10, 0),
              dropDownButton(
                "State",
                const Color.fromARGB(255, 238, 238, 238),
                FontWeight.w500,
                AppColors.grey,
                13,
              ),
              customSizeBox(10, 0),
              pTextField("Password"),
              customSizeBox(10, 0),
              pTextField("Confirm Password"),
              customSizeBox(10, 0),
              dropDownButton(
                "Type",
                const Color.fromARGB(255, 238, 238, 238),
                FontWeight.w500,
                AppColors.grey,
                13,
              ),
              customSizeBox(40, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: squareButton(15, AppColors.primary, "SIGN UP",
                        AppColors.white, 50, 100),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: signButton(
                        50,
                        200,
                        AppColors.primary,
                        "BACK TO LOGIN",
                        AppColors.white,
                        const Icon(
                          Icons.arrow_back_outlined,
                          color: AppColors.white,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
