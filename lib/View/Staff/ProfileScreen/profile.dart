import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

import '../../../Utils/Widgets/common_appbar.dart';
import 'forgot_password.dart';
import 'login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isForgotPassword = false.obs;
    void toggleForgotPassword() {
      isForgotPassword.value = !isForgotPassword.value;
    }

    //  isForgotPassword.value
    //     ?
    //     : Login(forgotPassword: () => toggleForgotPassword)

    Widget onboarding() {
      if (isForgotPassword.value) {
        return const ProfileForgotPassword();
      } else {
        return Login(forgotPassword: () => toggleForgotPassword());
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
