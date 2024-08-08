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
import 'package:my_kitchen_jobs/Utils/text_style.dart';

class JobAddScreen extends StatelessWidget {
  const JobAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DropdownController dropdownController = Get.put(DropdownController());
    JobsControllers jobC = Get.put(JobsControllers());

    TextEditingController expTec = TextEditingController();
    TextEditingController salaryTec = TextEditingController();
    TextEditingController addressTec = TextEditingController();
    var expHeader = false.obs;
    var salaryHeader = false.obs;
    var addHeader = false.obs;
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
                    child: Obx(
                      () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                color: AppColors.dgrey,
                                height: 80.h,
                                width: 80.h),
                            dropdownController.selectedPosition.value == ''
                                ? 10.h.height
                                : 15.h.height,
                            dropdownController.selectedPosition.value == ''
                                ? 0.h.height
                                : textGrey13Bold('POSITIONS'),
                            5.h.height,
                            DropDownButtonWidget(
                              greyColored: true,
                              hintText: "POSITIONS",
                              items: const [
                                "chef",
                                "Business",
                                "Andhra Pradesh",
                                "Jammu and Kashmir",
                              ],
                              selectedValue:
                                  dropdownController.selectedPosition,
                            ),
                            dropdownController.selectedGender.value == ''
                                ? 5.h.height
                                : 15.h.height,
                            dropdownController.selectedGender.value == ''
                                ? 0.h.height
                                : textGrey13Bold('GENDER'),
                            5.h.height,
                            DropDownButtonWidget(
                              greyColored: true,
                              hintText: "GENDER",
                              items: const [
                                "male",
                                "Female",
                                "Others",
                              ],
                              selectedValue: dropdownController.selectedGender,
                            ),
                            dropdownController.selectedState.value == ''
                                ? 5.h.height
                                : 15.h.height,
                            dropdownController.selectedState.value == ''
                                ? 0.0.height
                                : textGrey13Bold('STATE'),
                            5.h.height,
                            DropDownButtonWidget(
                              greyColored: true,
                              hintText: "STATES",
                              items: const [
                                "Maharashtra",
                                "667176beafbc7ade7d550d13",
                                "Andhra Pradesh",
                                "Jammu and Kashmir",
                              ],
                              selectedValue: dropdownController.selectedState,
                            ),
                            expHeader.value ? 15.h.height : 5.h.height,
                            expHeader.value
                                ? textGrey13Bold('EXPERIENCE')
                                : 0.h.height,
                            5.h.height,
                            CustomTextFormField(
                                onChnaged: (p0) {
                                  if (p0 == '') {
                                    expHeader.value = false;
                                  } else {
                                    expHeader.value = true;
                                  }
                                },
                                controller: expTec,
                                hint: "EXPERIENCE"),
                            salaryHeader.value ? 15.h.height : 5.h.height,
                            salaryHeader.value
                                ? textGrey13Bold('SALARY')
                                : 0.0.height,
                            5.h.height,
                            CustomTextFormField(
                                onChnaged: (p0) {
                                  if (p0 == '') {
                                    salaryHeader.value = false;
                                  } else {
                                    salaryHeader.value = true;
                                  }
                                },
                                controller: salaryTec,
                                hint: "SALARY",
                                keyBoardType: TextInputType.number),
                            addHeader.value ? 15.h.height : 5.h.height,
                            addHeader.value
                                ? textGrey13Bold('ADDRESS')
                                : 0.0.width,
                            5.h.height,
                            CustomTextFormField(
                                onChnaged: (p0) {
                                  if (p0 == '') {
                                    addHeader.value = false;
                                  } else {
                                    addHeader.value = true;
                                  }
                                },
                                controller: addressTec,
                                hint: "ADDRESS",
                                maxLine: 3),
                            10.h.height
                          ]),
                    )),
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
          } else if (expTec.text.isEmpty) {
            commonToast("Please enter your experience");
          } else if (salaryTec.text.isEmpty) {
            commonToast("Please enter your salary");
          } else if (addressTec.text.isEmpty) {
            commonToast("Please enter your address");
          } else {
            jobC.jobsApi(
              dropdownController.selectedPosition.value,
              dropdownController.selectedGender.value,
              dropdownController.selectedState.value,
              expTec.text,
              salaryTec.text,
              addressTec.text,
            );
          }
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            color: Colors.white,
            child: const SafeArea(child: CommonButton(text: "ADD JOB"))),
      ),
    );
  }
}
