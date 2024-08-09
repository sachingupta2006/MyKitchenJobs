import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/ProfileControllers/LoginControllers/forgot_controller.dart';
import 'package:my_kitchen_jobs/Controllers/ProfileControllers/LoginControllers/verify_otp_controller.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/common_toast.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/custom_textform_field.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/square_button.dart';

class ProfileForgotPassword extends StatelessWidget {
  const ProfileForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController otpController = TextEditingController();
    final ForgotController forgotC = Get.put(ForgotController());
    final VerifyOtpController verifyOtpC = Get.put(VerifyOtpController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "FORGOT PASSWORD",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                    ),
                    color: Color.fromARGB(255, 240, 240, 240),
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: AppColors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 12,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 53, // Match the height of the TextField
                child: GestureDetector(
                  onTap: () {
                    if (emailController.text.isEmpty) {
                      commonToast("User not found");
                    } else {
                      forgotC.forgotApi(emailController.text);
                    }
                  },
                  child: squareButton(
                    0,
                    AppColors.primary,
                    "SEND OTP",
                    AppColors.white,
                    0,
                    120,
                  ),
                ),
              ),
            ],
          ),
        ),
        customSizeBox(10, 0),
        pTextField("Enter OTP", ccontroller: otpController),
        customSizeBox(20, 0),
        GestureDetector(
          onTap: () {
            if (otpController.text.isEmpty) {
              commonToast("OTP is not entered");
            } else {
              if (forgotC.token != null) {
                verifyOtpC.verifyApi(otpController.text, forgotC.token!);
              } else {
                commonToast("Token not found");
              }
            }
          },
          child: squareButton(
            15,
            AppColors.primary,
            "VERIFY OTP AND LOGIN",
            AppColors.white,
            50,
            250,
          ),
        ),
      ],
    );
  }
}
