import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/dropdown_controller.dart';
import 'package:my_kitchen_jobs/Controllers/JobsControllers/jobs_controller.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/app_bar_text.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/common_toast.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/drop_down.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/profile_text_field.dart';
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
      backgroundColor: AppColors.white,
      appBar: appBar("ADD JOB"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customSizeBox(30, 0),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    color: AppColors.dgrey,
                    height: 80,
                    width: 80,
                  ),
                ),
                customSizeBox(10, 0),
                DropDownButtonWidget(
                  text: "POSITIONS",
                  color: const Color.fromARGB(255, 238, 238, 238),
                  fw: FontWeight.w500,
                  colors: AppColors.grey,
                  fs: 13,
                  items: const [
                    "chef",
                    "Business",
                    "Andhra Pradesh",
                    "Jammu and Kashmir",
                  ],
                  dropcolors: Colors.black,
                  selectedValue: dropdownController.selectedPosition,
                ),
                customSizeBox(10, 0),
                DropDownButtonWidget(
                  text: "GENDER",
                  color: const Color.fromARGB(255, 238, 238, 238),
                  fw: FontWeight.w500,
                  colors: AppColors.grey,
                  fs: 13,
                  items: const [
                    "male",
                    "Female",
                    "Others",
                  ],
                  dropcolors: Colors.black,
                  selectedValue: dropdownController.selectedGender,
                ),
                customSizeBox(10, 0),
                DropDownButtonWidget(
                  text: "STATES",
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
                  dropcolors: Colors.black,
                  selectedValue: dropdownController.selectedState,
                ),
                customSizeBox(10, 0),
                pTextField("EXPERIENCE", ccontroller: experienceController),
                customSizeBox(10, 0),
                pTextField("SALARY", ccontroller: salaryController),
                customSizeBox(10, 0),
                pTextField("ADDRESS",
                    he: 70, v: 25, ccontroller: addressController),
                customSizeBox(200, 0),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {
                  if (dropdownController.selectedPosition.value.isEmpty) {
                    commonToast("Select position");
                  }
                  if (dropdownController.selectedGender.value.isEmpty) {
                    commonToast('Invalid Gender');
                  }
                  if (dropdownController.selectedState.value.isEmpty) {
                    commonToast("Please Select State");
                  }
                  if (experienceController.text.isEmpty) {
                    commonToast("Please enter your experience");
                  }
                  if (salaryController.text.isEmpty) {
                    commonToast("Please enter your salary");
                  }
                  if (addressController.text.isEmpty) {
                    commonToast("Please enter your address");
                  } else {
                    jobC.jobsApi(
                      dropdownController.selectedPosition.value,
                      dropdownController.selectedGender.value,
                      dropdownController.selectedState.value,
                      salaryController.text,
                      experienceController.text,
                      addressController.text,
                    
                      
                    );
                  }
                },
                child: customButton("ADD JOB", 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
