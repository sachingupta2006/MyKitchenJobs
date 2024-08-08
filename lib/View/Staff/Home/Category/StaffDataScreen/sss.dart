import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_kitchen_jobs/Controllers/HomeControllers/StaffControllers/get_staff_details_controller.dart';
import 'package:my_kitchen_jobs/Controllers/tab_controller.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/custom_button.dart';
import 'package:my_kitchen_jobs/Utils/size_box.dart';
import 'package:my_kitchen_jobs/View/Staff/Home/Category/StaffDataScreen/staff_decription_tab.dart';
import 'package:my_kitchen_jobs/View/Staff/Home/Category/StaffDataScreen/staff_details_tab.dart';

import 'staff_pictures_tab.dart';

class StaffScreen extends StatefulWidget {
  final String chefId;

  const StaffScreen({Key? key, required this.chefId}) : super(key: key);

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen>
    with SingleTickerProviderStateMixin {
  final MyTabController tabController = Get.put(MyTabController());
  final RxBool isFavorite = false.obs;
  late TabController _internalTabController;
  final GetStaffDetailsController getChefC =
      Get.put(GetStaffDetailsController());

  @override
  void initState() {
    super.initState();
    _internalTabController = TabController(length: 3, vsync: this);
    _internalTabController.addListener(() {
      if (_internalTabController.indexIsChanging) {
        tabController.updateIndex(_internalTabController.index);
      }
    });

    _internalTabController.animation?.addListener(() {
      final double value = _internalTabController.animation!.value;
      tabController.updateIndex(value.round());
    });

    // Fetch chef details using the chefId when the screen is initialized
    getChefC.getChefApi(widget.chefId);
  }

  @override
  void dispose() {
    _internalTabController.dispose();
    super.dispose();
  }

  Widget _buildTab(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _internalTabController.animateTo(index);
        },
        child: Obx(() {
          bool isSelected = tabController.selectedIndex.value == index;
          return Container(
            height: 60,
            color: isSelected
                ? const Color.fromARGB(255, 240, 240, 240)
                : Colors.transparent,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(() {
        // Get the chef details from the controller
        final chefDetails = getChefC.staffData.value;

        if (getChefC.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (chefDetails == null) {
          return const Center(child: Text('No data available'));
        }

        final name = chefDetails.chefData?.name ?? 'Unknown';
        final state =
            chefDetails.chefData?.location?.state ?? 'Location Unknown';
        final profileImg = chefDetails.chefData?.profileImg ??
            'https://example.com/default-image.jpg';
        final dob = chefDetails.chefData?.dob ?? 'details';
        final salary = chefDetails.chefData?.visitRate ?? 'details';
        final experience = chefDetails.chefData?.experience ?? 'details';
        final descriptions = chefDetails.chefData?.about ?? 'description';

        return Stack(
          children: [
            Column(
              children: [
                AppBar(
                  actions: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColors.white,
                            ),
                          ),
                          Obx(() {
                            return IconButton(
                              onPressed: () {
                                isFavorite.value = !isFavorite.value;
                              },
                              icon: Icon(
                                isFavorite.value
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite.value
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                  automaticallyImplyLeading: false,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  toolbarHeight: 150,
                  backgroundColor: AppColors.primary,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    ' $name',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'CHEF FROM $state', // Display the chef's state
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                customSizeBox(50, 0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildTab("Details", 0),
                      _buildTab("Description", 1),
                      _buildTab("Pictures", 2),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _internalTabController,
                    children: [
                      StaffDetailsTab(
                          dob: dob, salary: salary, experience: experience),
                      StaffDecriptionTab(description: descriptions),
                      StaffPicturesTab(picture: [profileImg]),
                    ],
                  ),
                ),
                customSizeBox(20, 0),
                customButton("HIRE ME", 0),
                customSizeBox(20, 0),
              ],
            ),
            Positioned(
              top: 125,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: ClipOval(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(4.0),
                  child: ClipOval(
                    child: Image.network(
                      profileImg,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error); // Error placeholder
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
