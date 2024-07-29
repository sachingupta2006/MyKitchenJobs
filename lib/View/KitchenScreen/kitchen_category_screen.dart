import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Utils/KitchenUtils/app_bar.dart';
import 'package:my_kitchen_jobs/View/KitchenScreen/kitchen_employee_list.dart';
import 'package:my_kitchen_jobs/Utils/KitchenUtils/container.dart';

class KitchenCategoryScreen extends StatelessWidget {
  const KitchenCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 18,
          childAspectRatio: 1,
          children: [
            name("Chefs", "assets/images/chef.jpg", "CHEFS"),
            name("Home Cook", "assets/images/banner-03.jpg", "HOME COOK"),
            name("Kitchen Helper", "assets/images/bake.jpg", "KITCHEN HELPER"),
            name("Waiter", "assets/images/waiter.jpg", "WAITER"),
            name("Manager", "assets/images/manager.jpg", "MANAGER"),
            name("Bartender", "assets/images/bartender.jpg", "BARTENDER"),
            name("Housekeeping", "assets/images/banner-05.jpg", "HOUSEKEEPING"),
            name("Baking Specialist", "assets/images/baking.jpg",
                "BAKING SPECIALIST"),
            name("Receptionist", "assets/images/recep.jpg", "RECEPTIONIST"),
          ],
        ),
      ),
    );
  }
}

Widget name(String title, String image, String text) {
  return GestureDetector(
    onTap: () {
      Get.to(() => KitchenEmployeeList(title, text),
          transition: Transition.rightToLeft);
    },
    child: customContainer(image, title),
  );
}
