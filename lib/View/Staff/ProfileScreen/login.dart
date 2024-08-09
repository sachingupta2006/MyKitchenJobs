import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/common_toast.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';

import '../../../Controllers/ProfileControllers/LoginControllers/login_controller.dart';
import '../../../Utils/Widgets/custom_textform_field.dart';
import '../../../Utils/text_style.dart';
import 'profile_signup.dart';

class Login extends StatelessWidget {
  const Login({super.key, this.forgotPassword});
  final void Function()? forgotPassword;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    LoginController loginC = Get.put(LoginController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textBlack14Bold("LOGIN TO CONTINUE"),
        10.h.height,
        CustomTextFormField(hint: "Email", controller: emailController),
        10.h.height,
        CustomTextFormField(
            hint: "Password", controller: passwordController),
        10.h.height,
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          GestureDetector(
              onTap: forgotPassword,
              child: textPrimary14Bold("Forgot your password?"))
        ]),
        15.h.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                if (emailController.text.isEmpty) {
                  topToast('Invalid email,please enter valid email');
                } else if (passwordController.text.isEmpty) {
                  topToast("Please enter your password");
                } else {
                  loginC.loginApi(
                      emailController.text, passwordController.text);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                height: 45.h,
                color: AppColors.primary,
                child: Center(child: textWhite15Bold('Login')),
              ),
            ),
            15.w.width,
            GestureDetector(
              onTap: () {
                Get.to(() => const ProfileSignup());
              },
              child: Container(
                padding: EdgeInsets.only(left: 20.w, right: 15.w),
                height: 45.h,
                color: AppColors.primary,
                child: Center(
                    child: Row(
                  children: [
                    textWhite15Bold('SIGN UP'),
                    5.w.width,
                    Icon(Icons.arrow_forward,
                        color: AppColors.white, size: 20.sp)
                  ],
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
