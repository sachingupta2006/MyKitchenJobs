import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/ProfileControllers/LoginControllers/forgot_controller.dart';
import 'package:my_kitchen_jobs/Controllers/ProfileControllers/LoginControllers/verify_otp_controller.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/top_toast.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/custom_textform_field.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/text_style.dart';

class ProfileForgotPassword extends StatelessWidget {
  const ProfileForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController otpController = TextEditingController();
    final ForgotController forgotC = Get.put(ForgotController());
    final VerifyOtpController verifyOtpC = Get.put(VerifyOtpController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textBlack14Bold("FORGOT PASSWORD"),
        10.h.height,
        Row(
          children: [
            Expanded(
                child: CustomTextFormField(
                    hint: "Email", controller: emailController)),
            GestureDetector(
              onTap: () {
                if (emailController.text.isEmpty) {
                  topToast("User not found");
                } else {
                  forgotC.forgotApi(emailController.text);
                }
              },
              child: Container(
                padding: EdgeInsets.only(left: 20.w, right: 15.w),
                height: 45.h,
                color: AppColors.primary,
                child: Center(child: textWhite15Bold('SEND OTP')),
              ),
            ),
          ],
        ),
        10.h.height,
        CustomTextFormField(hint: "Enter OTP", controller: otpController),
        15.h.height,
        GestureDetector(
          onTap: () {
            if (otpController.text.isEmpty) {
              topToast("OTP is not entered");
            } else {
              if (forgotC.token != null) {
                verifyOtpC.verifyApi(otpController.text, forgotC.token!);
              } else {
                topToast("Token not found");
              }
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 45.h,
                  color: AppColors.primary,
                  child:
                      Center(child: textWhite15Bold('VERIFY OTP AND LOGIN'))),
            ],
          ),
        ),
      ],
    );
  }
}
