import 'package:com.rado.valorant/views/widgets/default_box_decoration.dart';
import 'package:com.rado.valorant/views/screens/weapons_screen.dart';
import 'package:com.rado.valorant/controllers/home_controller.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/views/screens/agents_screen.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:com.rado.valorant/views/screens/maps_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: defaultBoxDecoration(),
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            controller.weapons.isEmpty || controller.agents.isEmpty || controller.maps.isEmpty ? controller.fetchData(): null;
            return IndexedStack(
              index: controller.currentIndex,
              children: [
                WeaponsScreen(),
                AgentsScreen(),
                MapsScreen(),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return BottomNavigationBar(
            iconSize: 0.sp,
            unselectedLabelStyle: TextStyle(
              fontSize: 14.sp,
            ),
            selectedItemColor: AppColors.red,
            unselectedItemColor: AppColors.white,
            selectedLabelStyle: TextStyle(
              fontSize: 18.sp,
            ),
            currentIndex: controller.currentIndex,
            onTap: controller.changeTab,
            items: const [
              BottomNavigationBarItem(
                icon: SizedBox(),
                label: AppStrings.weaponsText,
              ),
              BottomNavigationBarItem(
                icon: SizedBox(),
                label: AppStrings.agentsText,
              ),
              BottomNavigationBarItem(
                icon: SizedBox(),
                label: AppStrings.mapsText,
              ),
            ],
          );
        },
      ),
    );
  }
}
