import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_bar.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/category_card.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/gradient_text.dart';
import 'package:my_kitchen_jobs/Utils/sizebox.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
              SizedBox(
                height: 140,
              ),
              Text("Browse Our Staff Offerings"),
              sizedBox(),
              Container(
                  child: GradientText("Our Chefs",
                      gradient: LinearGradient(
                          colors: [AppColors.gsblue, AppColors.gdblue]),
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.w600))),
              SizedBox(
                height: 150,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0))),
                    items: [],
                    onChanged: (value) {}),
              ),
              sizedBox(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0))),
                    items: [],
                    onChanged: (value) {}),
              ),
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
                  Text("Female"),
                  Radio(
                    value: 1,
                    groupValue: 0,
                    onChanged: (value) {},
                  ),
                  Text("Male"),
                  Radio(
                    value: 1,
                    groupValue: 0,
                    onChanged: (value) {},
                  ),
                  Text("All"),
                ],
              ),
              sizedBox(),
              Column(
                children: [
                  Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 180, bottom: 15, top: 15),
                    child: customButton("View All"),
                  ),
                  Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 0,
                  )
                ],
              ),
              sizedBox(),
              categoryCard(),
              sizedBox(),
              categoryCard(),
              sizedBox(),
              categoryCard(),
              sizedBox(),
              categoryCard(),
            ],
          ),
        ),
      ),
    );
  }
}
