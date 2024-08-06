import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/UsersControllers/login_controller.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/app_bar_text.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/profile_text_field.dart';

import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/square_button.dart';
import 'package:my_kitchen_jobs/View/Staff/HomeScreen/JobsScreen/WishlistScreen/ProfileScreen/profile_forgot_password.dart';
import 'package:my_kitchen_jobs/View/Staff/HomeScreen/JobsScreen/WishlistScreen/ProfileScreen/profile_signup.dart';

import '../../../../../../Utils/UsersUtils/common_toast.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isForgotPassword = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginController loginC = Get.put(LoginController());

  void toggleForgotPassword() {
    setState(() {
      isForgotPassword = !isForgotPassword;
    });
  }

  // bool validateEmail(String email) {
  //   if (email.isEmpty) return false;
  //   String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  //   RegExp regex = RegExp(pattern);
  //   return regex.hasMatch(email);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBar("MY PROFILE"),
      body: isForgotPassword ? ProfileForgotPassword() : buildLogin(),
    );
  }

  Widget buildLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            "LOGIN TO CONTINUE",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        pTextField("Email", ccontroller: emailController),
        customSizeBox(10, 0),
        pTextField("Password", ccontroller: passwordController),
        customSizeBox(10, 0),
        Padding(
          padding: const EdgeInsets.only(left: 200),
          child: GestureDetector(
            onTap: toggleForgotPassword,
            child: const Text(
              "Forgot your password?",
              style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ),
          ),
        ),
        customSizeBox(25, 0),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (emailController.text.isEmpty) {
                  commonToast('Invalid email,please enter valid email');
                }
                if (passwordController.text.isEmpty) {
                  commonToast("Please enter your password");
                } else {
                  loginC.loginApi(
                      emailController.text, passwordController.text);
                }
              },
              child: squareButton(
                  15, AppColors.primary, "LOGIN", AppColors.white, 50, 120),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const ProfileSignup());
              },
              child: squareButton(
                  15, AppColors.primary, "SIGN UP", AppColors.white, 50, 120,
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: AppColors.white,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
