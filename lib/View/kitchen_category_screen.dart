import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_bar.dart';
import 'package:my_kitchen_jobs/View/kichen_bottom_bar.dart';

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
            name("Chefs", "assets/images/chef.jpg"),
            name("Home Cook", "assets/images/banner-03.jpg"),
            name("Kitchen Helper", "assets/images/bake.jpg"),
            name("Waiter", "assets/images/waiter.jpg"),
            name("Manager", "assets/images/manager.jpg"),
            name("Bartender", "assets/images/bartender.jpg"),
            name("Housekeeping", "assets/images/banner-05.jpg"),
            name("Baking Specialist", "assets/images/baking.jpg"),
            name("Receptionist", "assets/images/recep.jpg"),
          ],
        ),
      ),
    );
  }
}
