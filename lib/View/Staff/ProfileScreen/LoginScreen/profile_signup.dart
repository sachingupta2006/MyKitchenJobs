import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/dropdown_controller.dart';
import 'package:my_kitchen_jobs/Controllers/ProfileControllers/LoginControllers/signup_controllers.dart';
import 'package:my_kitchen_jobs/View/Staff/ProfileScreen/LoginScreen/app_bar_text.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/common_toast.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/drop_down.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/profile_text_field.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/square_button.dart';

class ProfileSignup extends StatefulWidget {
  const ProfileSignup({super.key});

  @override
  State<ProfileSignup> createState() => _ProfileSignupState();
}

class _ProfileSignupState extends State<ProfileSignup> {
  final SignupControllers signC = Get.put(SignupControllers());
  final DropdownController dropdownController = Get.put(DropdownController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.white,
        appBar: appBar("MY PROFILE"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customSizeBox(40, 0),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  "SIGN UP TO CONTINUE",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              pTextField("Name", ccontroller: nameController),
              customSizeBox(10, 0),
              pTextField("Email", ccontroller: emailController),
              customSizeBox(10, 0),
              pTextField("Phone number", ccontroller: phoneController),
              customSizeBox(10, 0),
              DropDownButtonWidget(
                text: "State",
                color: const Color.fromARGB(255, 238, 238, 238),
                fw: FontWeight.w500,
                colors: AppColors.grey,
                fs: 13,
                items: const [
                  "Maharashtra",
                  "667176beafbc7ade7d550d13",
                  "Andhra Pradesh",
                  "Jammu and Kashmir",
                ],
                selectedValue: dropdownController.selectedState,
              ),
              customSizeBox(10, 0),
              pTextField("Password", ccontroller: passwordController),
              customSizeBox(10, 0),
              pTextField("Confirm Password", ccontroller: cpasswordController),
              customSizeBox(10, 0),
              DropDownButtonWidget(
                text: "Type",
                color: const Color.fromARGB(255, 238, 238, 238),
                fw: FontWeight.w500,
                colors: AppColors.grey,
                fs: 13,
                items: const [
                  "Male",
                  "business",
                  "Others",
                ],
                selectedValue: dropdownController.selectedGender,
              ),
              customSizeBox(40, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (nameController.text.isEmpty) {
                        commonToast("Invalid name");
                      } else if (emailController.text.isEmpty) {
                        commonToast(
                            'Invalid email, please enter a valid email');
                      } else if (phoneController.text.isEmpty) {
                        commonToast("Please enter your phone number");
                      } else if (dropdownController
                          .selectedState.value.isEmpty) {
                        commonToast("Please select your state");
                      } else if (passwordController.text.isEmpty) {
                        commonToast("Please enter your password");
                      } else if (cpasswordController.text.isEmpty) {
                        commonToast("Please enter your confirm password");
                      } else if (dropdownController
                          .selectedGender.value.isEmpty) {
                        commonToast("Please select your type");
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
                    child: squareButton(
                      15,
                      AppColors.primary,
                      "SIGN UP",
                      AppColors.white,
                      50,
                      100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: squareButton(
                      15,
                      AppColors.primary,
                      "BACK TO LOGIN",
                      AppColors.white,
                      50,
                      200,
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
