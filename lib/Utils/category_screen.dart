import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/modal_bottom_sheet.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(this.texts, {super.key});

  final String texts;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text(
            texts,
            style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
          actions: [
            IconButton(
              color: AppColors.white,
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              color: AppColors.white,
              onPressed: () {
                customModal(context);
              },
              icon: const Icon(Icons.filter_list_sharp),
            )
          ],
        ),
        body: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) => Stack(
            children: [
              Positioned(
                left: 10,
                child: Container(
                  height: 300,
                  width: 140,
                  color: const Color.fromARGB(255, 214, 212, 212),
                ),
              ),
              Positioned(
                left: 10,
                child: Container(
                  height: 130,
                  width: 140,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/baking.jpg",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              const Positioned(
                left: 55,
                top: 130,
                child: Text("Omkar"),
              ),
              const Positioned(
                  left: 35,
                  top: 150,
                  child: Text(
                    "Maharashtra",
                    style: TextStyle(color: AppColors.primary),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
