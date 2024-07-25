import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/JobsControllers/jobs_controller.dart';
import 'package:my_kitchen_jobs/Controllers/dropdown_controller.dart';
import 'package:my_kitchen_jobs/Controllers/JobsControllers/jobs_update_controller.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/app_bar_text.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/common_toast.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/JobsUtils/job_text.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/profile_text_field.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/Utils/UsersUtils/drop_down.dart';

class JobUpdateScreen extends StatelessWidget {
  const JobUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DropdownController dropdownController = Get.put(DropdownController());
    JobsUpdateControllers jobUpdateC = Get.put(JobsUpdateControllers());
    TextEditingController experienceController = TextEditingController();
    TextEditingController salaryController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBar("UPDATE JOB"),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                bottom: 80), // To prevent overlapping with the button
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customSizeBox(20, 0),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    backgroundImage: AssetImage("assets/images/recep.jpg"),
                    radius: 40,
                  ),
                ),
                customSizeBox(15, 0),
                jobText("POSITIONS"),
                DropDownButtonWidget(
                  text: "POSITIONS",
                  color: const Color.fromARGB(255, 238, 238, 238),
                  fw: FontWeight.w500,
                  colors: Colors.black,
                  fs: 15,
                  items: const [
                    "chef",
                    "Uttar Pradesh",
                    "Andhra Pradesh",
                    "Jammu and Kashmir",
                  ],
                  dropcolors: Colors.black,
                  selectedValue: dropdownController.selectedPosition,
                ),
                customSizeBox(10, 0),
                jobText("GENDER"),
                DropDownButtonWidget(
                  text: "GENDER",
                  color: const Color.fromARGB(255, 238, 238, 238),
                  fw: FontWeight.w500,
                  colors: Colors.black,
                  fs: 15,
                  items: const [
                    "male",
                    "female",
                    "others",
                  ],
                  dropcolors: Colors.black,
                  selectedValue: dropdownController.selectedGender,
                ),
                customSizeBox(10, 0),
                jobText("STATES"),
                DropDownButtonWidget(
                  text: "STATES",
                  color: const Color.fromARGB(255, 238, 238, 238),
                  fw: FontWeight.w500,
                  colors: Colors.black,
                  fs: 15,
                  items: const [
                    "667176beafbc7ade7d550d13",
                    "Uttar Pradesh",
                    "Andhra Pradesh",
                    "Jammu and Kashmir",
                  ],
                  dropcolors: Colors.black,
                  selectedValue: dropdownController.selectedState,
                ),
                customSizeBox(10, 0),
                jobText(
                  "EXPERIENCE",
                ),
                pTextField("EXPERIENCE", ccontroller: experienceController),
                customSizeBox(10, 0),
                jobText("SALARY"),
                pTextField("SALARY", ccontroller: salaryController),
                customSizeBox(10, 0),
                jobText("ADDRESS"),
                pTextField("ADDRESS",
                    he: 70, v: 20, ccontroller: addressController),
                customSizeBox(170, 0)
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
                  Get.to(() => const JobUpdateScreen());
                },
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
                      if (dropdownController.selectedState.value.isEmpty) {
                        commonToast("Please select your state");
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
                        jobUpdateC.jobsUpdateApi(
                          dropdownController.selectedPosition.value,
                          dropdownController.selectedGender.value,
                          dropdownController.selectedState.value,
                          salaryController.text,
                          experienceController.text,
                          addressController.text,
                          
                        );
                      }
                    },
                    child: customButton("ADD JOB", 0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
