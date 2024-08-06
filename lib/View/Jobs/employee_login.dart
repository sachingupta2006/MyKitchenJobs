import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';

import 'package:my_kitchen_jobs/View/Jobs/text_field.dart';

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
                  customSizeBox(20, 0),
                  const Text("Email Adress"),
                  customSizeBox(20, 0),
                  CustomText(const Icon(Icons.email), "Email", false,
                      controllers: usernameController,
                      hinttext: "Enter You Email"),
                  customSizeBox(20, 0),
                  const Text("Password"),
                  customSizeBox(20, 0),
                  CustomText(
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye_sharp)),
                      "Enter your Password",
                      true,
                      controllers: passwordController,
                      hinttext: "Enter Your Password"),
                  customSizeBox(20, 0),
                  customButton("Login", 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
