import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_bar.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/category_card.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/drop_down.dart';
import 'package:my_kitchen_jobs/Utils/gradient_text.dart';
import 'package:my_kitchen_jobs/Utils/sizebox.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(this.category, {super.key});

  final String category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 140,
              ),
              const Text("Browse Our Staff Offerings"),
              sizedBox(),
              GradientText(
                category,
                gradient: const LinearGradient(
                  colors: [AppColors.gsblue, AppColors.gdblue],
                ),
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 150,
              ),
              dropDownButton(),
              sizedBox(),
              dropDownButton(),
              sizedBox(),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: 0,
                    onChanged: (value) {},
                  ),
                  const Text("Female"),
                  Radio(
                    value: 1,
                    groupValue: 0,
                    onChanged: (value) {},
                  ),
                  const Text("Male"),
                  Radio(
                    value: 1,
                    groupValue: 0,
                    onChanged: (value) {},
                  ),
                  const Text("All"),
                ],
              ),
              sizedBox(),
              Column(
                children: [
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 180, bottom: 15, top: 15),
                    child: customButton("View All"),
                  ),
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 0,
                  )
                ],
              ),
              sizedBox(),
              categoryCard(
                  "assets/images/bake.jpg", "Aakash", "Receptionist and Chef"),
              sizedBox(),
              categoryCard("assets/images/bartender.jpg", "Rahul",
                  "Receptionist and Waiter"),
              sizedBox(),
              categoryCard("assets/images/banner-05.jpg", "Rishi", "Chef"),
              sizedBox(),
              categoryCard("assets/images/banner-04.jpg", "Viraj",
                  "Receptionist and Chef"),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
