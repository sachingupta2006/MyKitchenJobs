import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/forgot_controller.dart';
import 'package:my_kitchen_jobs/Controllers/verify_otp_controller.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/common_toast.dart';
import 'package:my_kitchen_jobs/Utils/profile_text_field.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/square_button.dart';

class ProfileForgotPassword extends StatelessWidget {
  ProfileForgotPassword({
    super.key,
  });
  TextEditingController emailController = TextEditingController();
  TextEditingController otpContoller = TextEditingController();
  ForgotController forgotC = Get.put(ForgotController());
  VerifyOtpController verifyOtpC = Get.put(VerifyOtpController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            "FORGOT PASSWORD",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
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
                          fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 12),
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
        pTextField("Enter OTP", ccontroller: otpContoller),
        customSizeBox(20, 0),
        GestureDetector(
          onTap: () {
            if (otpContoller.text.isEmpty) {
              commonToast("otp is not enter");
            } else {
              verifyOtpC.verifyApi(otpContoller.text);
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
