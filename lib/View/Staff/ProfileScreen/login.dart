import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/top_toast.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';

import '../../../Controllers/Onboarding/login_controller.dart';
import '../../../Utils/Widgets/custom_textform_field.dart';
import '../../../Utils/common_loader.dart';
import '../../../Utils/text_style.dart';

class Login extends StatelessWidget {
  const Login({super.key, this.forgotPassword, this.signUp});
  final void Function()? forgotPassword;
  final void Function()? signUp;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTec = TextEditingController();
    TextEditingController passwordTec = TextEditingController();
    LoginController loginC = Get.put(LoginController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textBlack14Bold("LOGIN TO CONTINUE"),
        10.h.height,
        CustomTextFormField(hint: "Email", controller: emailTec),
        10.h.height,
        CustomTextFormField(hint: "Password", controller: passwordTec),
        10.h.height,
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          GestureDetector(
              onTap: forgotPassword,
              child: textPrimary14Bold("Forgot your password?"))
        ]),
        15.h.height,
        Obx(
          () => loginC.isLoading.value
              ? commonLoader()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        String email = emailTec.text.trim();
                        bool isValidEmail() {
                          RegExp regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
                          return regex.hasMatch(email);
                        }

                        if (emailTec.text.isEmpty) {
                          topToast('please enter your email');
                        } else if (!isValidEmail()) {
                          topToast('Please enter valid email');
                        } else if (passwordTec.text.isEmpty) {
                          topToast("Please enter your password");
                        } else {
                          loginC.loginApi(email, passwordTec.text);
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
                      onTap: signUp,
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
        ),
      ],
    );
  }
}
