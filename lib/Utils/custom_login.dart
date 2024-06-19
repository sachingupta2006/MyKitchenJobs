import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/sizebox.dart';
import 'package:my_kitchen_jobs/Utils/text_field.dart';

class CustomLogin extends StatelessWidget {
  CustomLogin(this.texts, {super.key});

  final String texts;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1D84FD),
          title: Image.asset(
            "assets/images/logoblur.jpeg",
          ),
        ),
        body: SingleChildScrollView(
          child: Card(
            color: AppColors.white,
            child: Center(
              child: Column(
                children: [
                  const Text("Name"),
                  sizedBox(),
                  const Text("Email Adress"),
                  sizedBox(),
                  CustomText(const Icon(Icons.email), "Email", false,
                      controllers: usernameController,
                      hinttext: "Enter You Email"),
                  sizedBox(),
                  const Text("Password"),
                  sizedBox(),
                  CustomText(
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye_sharp)),
                      "Enter your Password",
                      true,
                      controllers: passwordController,
                      hinttext: "Enter Your Password"),
                  sizedBox(),
                  customButton("Login"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
