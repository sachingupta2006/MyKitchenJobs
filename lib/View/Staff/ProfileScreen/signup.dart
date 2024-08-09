import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/dropdown_controller.dart';
import 'package:my_kitchen_jobs/Controllers/ProfileControllers/LoginControllers/signup_controllers.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/top_toast.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_drop_down.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/custom_textform_field.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/text_style.dart';

class Signup extends StatelessWidget {
  const Signup({super.key, this.login});
  final void Function()? login;
  @override
  Widget build(BuildContext context) {
    final SignupControllers signC = Get.put(SignupControllers());
    final DropdownController dropdownController = Get.put(DropdownController());

    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController cpasswordController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textBlack14Bold("SIGN UP TO CONTINUE"),
        10.h.height,
        CustomTextFormField(hint: "Name", controller: nameController),
        10.h.height,
        CustomTextFormField(hint: "Email", controller: emailController),
        10.h.height,
        CustomTextFormField(hint: "Phone number", controller: phoneController),
        10.h.height,
        DropDownButtonWidget(
          greyColored: true,
          hintText: "State",
          items: const [
            "Maharashtra",
            "667176beafbc7ade7d550d13",
            "Andhra Pradesh",
            "Jammu and Kashmir",
          ],
          selectedValue: dropdownController.selectedState,
        ),
        10.h.height,
        CustomTextFormField(hint: "Password", controller: passwordController),
        10.h.height,
        CustomTextFormField(
            hint: "Confirm Password", controller: cpasswordController),
        10.h.height,
        DropDownButtonWidget(
          greyColored: true,
          hintText: "Type",
          items: const [
            "Male",
            "business",
            "Others",
          ],
          selectedValue: dropdownController.selectedGender,
        ),
        20.h.height,
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (nameController.text.isEmpty) {
                  topToast("Invalid name");
                } else if (emailController.text.isEmpty) {
                  topToast('Invalid email, please enter a valid email');
                } else if (phoneController.text.isEmpty) {
                  topToast("Please enter your phone number");
                } else if (dropdownController.selectedState.value.isEmpty) {
                  topToast("Please select your state");
                } else if (passwordController.text.isEmpty) {
                  topToast("Please enter your password");
                } else if (cpasswordController.text.isEmpty) {
                  topToast("Please enter your confirm password");
                } else if (dropdownController.selectedGender.value.isEmpty) {
                  topToast("Please select your type");
                } else {
                  signC.signupApi(
                    nameController.text,
                    emailController.text,
                    phoneController.text,
                    dropdownController.selectedState.value,
                    passwordController.text,
                    cpasswordController.text,
                    dropdownController.selectedGender.value,
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                height: 45.h,
                color: AppColors.primary,
                child: Center(child: textWhite15Bold('SIGN UP')),
              ),
            ),
            15.w.width,
            GestureDetector(
              onTap: login,
              child: Container(
                padding: EdgeInsets.only(left: 20.w, right: 15.w),
                height: 45.h,
                color: AppColors.primary,
                child: Center(
                    child: Row(
                  children: [
                    textWhite15Bold('BACK TO LOGIN'),
                    5.w.width,
                    Icon(Icons.arrow_back, color: AppColors.white, size: 20.sp)
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
