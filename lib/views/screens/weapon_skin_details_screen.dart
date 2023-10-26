import 'package:com.rado.valorant/views/widgets/build_cached_network_image.dart';
import 'package:com.rado.valorant/views/widgets/default_box_decoration.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeaponSkinDetailsScreen extends StatelessWidget {
  const WeaponSkinDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final skin = args[AppStrings.skinArgsText];
    final itemIndex = args[AppStrings.itemIndexArgsText];
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: defaultBoxDecoration(),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250.sp,
                    width: double.infinity,
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: "${skin.displayName}${AppStrings.skinNumberTagText}$itemIndex",
                      child: buildCachedNetworkImage(
                        imageUrl: skin.displayIcon ?? AppStrings.emptyText,
                        fit: BoxFit.contain,
                        justIconWhenError: true,
                        errorColor: AppColors.white,
                        placeholderColor: AppColors.transparentWhite,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Center(
                      child: Text(
                        skin.displayName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 40.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
