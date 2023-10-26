import 'package:com.rado.valorant/views/widgets/build_map_and_weapon_item.dart';
import 'package:com.rado.valorant/views/widgets/build_check_internet.dart';
import 'package:com.rado.valorant/controllers/home_controller.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeaponsScreen extends StatelessWidget {
  const WeaponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        if (controller.weapons.isEmpty) {
          return buildCheckInternet();
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.sp,
              mainAxisSpacing: 5.sp,
              mainAxisExtent: 234.sp,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.weapons.length,
            itemBuilder: (context, itemIndex) {
              final weapon = controller.weapons[itemIndex];
              return Hero(
                transitionOnUserGestures: true,
                tag: "${weapon.displayName}${AppStrings.weaponNumberTagText}$itemIndex",
                child: buildMapAndWeaponItem(
                  onClick: () {
                    Get.toNamed(
                      AppStrings.weaponDetailsRout,
                      arguments: {
                        AppStrings.weaponArgsText: weapon,
                        AppStrings.itemIndexArgsText: itemIndex,
                      },
                    );
                  },
                  fit: BoxFit.contain,
                  imageUrl: weapon.displayIcon.toString(),
                  name: weapon.displayName.toString(),
                ),
              );
            },
          );
        }
      },
    );
  }
}
