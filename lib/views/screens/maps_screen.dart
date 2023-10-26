import 'package:com.rado.valorant/views/widgets/build_map_and_weapon_item.dart';
import 'package:com.rado.valorant/views/widgets/build_check_internet.dart';
import 'package:com.rado.valorant/controllers/home_controller.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        if (controller.maps.isEmpty) {
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
            itemCount: controller.maps.length,
            itemBuilder: (context, itemIndex) {
              final map = controller.maps[itemIndex];
              return Hero(
                transitionOnUserGestures: true,
                tag: "${map.displayName}${AppStrings.mapNumberTagText}$itemIndex",
                child: buildMapAndWeaponItem(
                  onClick: () {
                    Get.toNamed(
                      AppStrings.mapDetailsRout,
                      arguments: {
                        AppStrings.mapArgsText: map,
                        AppStrings.itemIndexArgsText: itemIndex,
                      },
                    );
                  },
                  imageUrl: map.splash.toString(),
                  name: map.displayName.toString(),
                ),
              );
            },
          );
        }
      },
    );
  }
}
