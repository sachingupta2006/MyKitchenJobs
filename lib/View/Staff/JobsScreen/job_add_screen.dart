import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/dropdown_controller.dart';
import 'package:my_kitchen_jobs/Controllers/JobsController/jobs_controller.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_botton.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_appbar.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/common_toast.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/common_drop_down.dart';
import 'package:my_kitchen_jobs/Utils/Widgets/custom_textform_field.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';

class JobAddScreen extends StatelessWidget {
  const JobAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DropdownController dropdownController = Get.put(DropdownController());
    JobsControllers jobC = Get.put(JobsControllers());

    TextEditingController experienceController = TextEditingController();
    TextEditingController salaryController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonAppbar(title: 'ADD JOB'),
              20.h.height,
              Expanded(
                child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              color: AppColors.dgrey,
                              height: 80.h,
                              width: 80.h),
                          10.h.height,
                          DropDownButtonWidget(
                            greyColored: true,
                            text: "POSITIONS",
                            items: const [
                              "chef",
                              "Business",
                              "Andhra Pradesh",
                              "Jammu and Kashmir",
                            ],
                            selectedValue: dropdownController.selectedPosition,
                          ),
                          10.h.height,
                          DropDownButtonWidget(
                            greyColored: true,
                            text: "GENDER",
                            items: const [
                              "male",
                              "Female",
                              "Others",
                            ],
                            selectedValue: dropdownController.selectedGender,
                          ),
                          10.h.height,
                          DropDownButtonWidget(
                            greyColored: true,
                            text: "STATES",
                            items: const [
                              "Maharashtra",
                              "667176beafbc7ade7d550d13",
                              "Andhra Pradesh",
                              "Jammu and Kashmir",
                            ],
                            selectedValue: dropdownController.selectedState,
                          ),
                          10.h.height,
                          const CustomTextFormField(hint: "EXPERIENCE"),
                          10.h.height,
                          const CustomTextFormField(
                              hint: "SALARY",
                              keyBoardType: TextInputType.number),
                          10.h.height,
                          const CustomTextFormField(
                              hint: "ADDRESS", maxLine: 3),
                          10.h.height
                        ])),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (dropdownController.selectedPosition.value.isEmpty) {
            commonToast("Select position");
          } else if (dropdownController.selectedGender.value.isEmpty) {
            commonToast('Invalid Gender');
          } else if (dropdownController.selectedState.value.isEmpty) {
            commonToast("Please Select State");
          } else if (experienceController.text.isEmpty) {
            commonToast("Please enter your experience");
          } else if (salaryController.text.isEmpty) {
            commonToast("Please enter your salary");
          } else if (addressController.text.isEmpty) {
            commonToast("Please enter your address");
          } else {
            jobC.jobsApi(
              dropdownController.selectedPosition.value,
              dropdownController.selectedGender.value,
              dropdownController.selectedState.value,
              experienceController.text,
              salaryController.text,
              addressController.text,
            );
          }
        },
        child: Container(
            color: Colors.white,
            child: const SafeArea(child: CommonButton(text: "ADD JOB"))),
      ),
    );
  }
}
