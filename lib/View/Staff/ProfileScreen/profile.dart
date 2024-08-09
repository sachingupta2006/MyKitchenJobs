import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/View/Staff/ProfileScreen/signup.dart';
import 'package:my_kitchen_jobs/View/Staff/ProfileScreen/staff_profile.dart';
import 'package:my_kitchen_jobs/main.dart';

import '../../../Utils/Widgets/common_appbar.dart';
import 'forgot_password.dart';
import 'login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isForgotPassword = false.obs;
    var isSignup = false.obs;

    Widget onboarding() {
      if (homeC.token != '' && isSignup.value != null) {
        return const StaffProfile();
      } else if (isForgotPassword.value) {
        return const ProfileForgotPassword();
      } else if (isSignup.value) {
        return Signup(login: () {
          isSignup.value = false;
          isForgotPassword.value = false;
        });
      } else {
        return Login(
          forgotPassword: () {
            isSignup.value = false;
            isForgotPassword.value = true;
          },
          signUp: () {
            isForgotPassword.value = false;
            isSignup.value = true;
          },
        );
      }
    }

    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CommonAppbar(title: "MY PROFILE", back: false),
              Expanded(
                  child: Obx(
                () => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: onboarding()),
              ))
            ]));
  }
}
