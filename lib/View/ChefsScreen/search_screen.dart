import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/KitchenUtils/app_bar.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.dgrey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: AppColors.lgrey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 20.0,
                      ),
                    ),
                    onChanged: (value) {
                      // Handle search logic here
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    searchController.clear();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2.0),
            // Expanded(
            //   child: ListView.separated(
            //     itemCount:
            //         10, // Replace with the actual number of search results
            //     itemBuilder: (context, index) {
            //       return SizedBox(
            //         height: 30,
            //         child: ListTile(
            //           contentPadding: const EdgeInsets.symmetric(

            //             horizontal: 16.0,
            //           ),
            //           leading: Icon(
            //             Icons.search,
            //             size: 20,
            //           ),
            //           title: Text('Chef $index'),
            //           onTap: () {
            //             // Handle result tap here
            //           },
            //         ),
            //       );
            //     },
            //     separatorBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(),
            //         child: Divider(
            //           color: Colors.grey.shade300,
            //           thickness: 1,
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
