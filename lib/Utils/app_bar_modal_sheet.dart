import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/app_colors.dart';
import 'package:my_kitchen_jobs/Utils/square_button.dart';

class AppBarModalSheet extends StatelessWidget {
  const AppBarModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Logout and Switch mode",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(thickness: 1),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Are you sure you want to logout and switch modes? ",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                squareButton(
                    15, AppColors.white, "NO CANCEL", Colors.black, 40, 320),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Text(
                                  "Switch mode",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Divider(thickness: 1),
                              const SizedBox(height: 16),
                              const Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Are you sure you want to switch modes? ",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              squareButton(15, AppColors.white, "NO CANCEL",
                                  Colors.black, 40, 320),
                              const SizedBox(
                                height: 10,
                              ),
                              squareButton(15, AppColors.primary, "YES SWITCH",
                                  AppColors.white, 40, 320)
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 320,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: const Center(
                        child: Text(
                          "YES,LOGOUT AND SWITCH",
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Icon(
          Icons.refresh,
          color: AppColors.white,
        ),
      ),
    );
  }
}
