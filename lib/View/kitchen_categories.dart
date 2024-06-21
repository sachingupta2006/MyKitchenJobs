import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_bar.dart';
import 'package:my_kitchen_jobs/Utils/category_screen.dart';
import 'package:my_kitchen_jobs/Utils/container.dart';
import 'package:get/get.dart';

class KitchenCategory extends StatelessWidget {
  const KitchenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const CategoryScreen("Our Chefs", "Chef"),
                  );
                },
                child: customContainer("assets/images/chef.jpg", "Chef"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const CategoryScreen("Our Home Cook", "Home Cook"),
                  );
                },
                child:
                    customContainer("assets/images/banner-03.jpg", "Home cook"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 5, 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const CategoryScreen(
                        "Our Kitchen helper", "Kitchen helper"),
                  );
                },
                child:
                    customContainer("assets/images/bake.jpg", "Kitchen helper"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const CategoryScreen("Our Waiter", "Waiter"),
                  );
                },
                child: customContainer("assets/images/waiter.jpg", "Waiter"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 5, 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const CategoryScreen("Our Manager", "Manager"),
                  );
                },
                child: customContainer("assets/images/manager.jpg", "Manager"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const CategoryScreen("Our Bartender", "Bartender"),
                  );
                },
                child:
                    customContainer("assets/images/bartender.jpg", "Bartender"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 5, 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const CategoryScreen(
                        "Our Housekeeping", "HouseKeeping"),
                  );
                },
                child: customContainer(
                    "assets/images/banner-05.jpg", "Housekeeping"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const CategoryScreen(
                        "Our Baking specialist", "Baking Specialist"),
                  );
                },
                child: customContainer(
                    "assets/images/baking.jpg", "Baking specialist"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 5, 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const CategoryScreen(
                        "Our Receptionist", "Receptionist"),
                  );
                },
                child:
                    customContainer("assets/images/recep.jpg", "Receptionist"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
