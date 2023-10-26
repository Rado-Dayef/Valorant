import 'package:com.rado.valorant/views/widgets/build_cached_network_image.dart';
import 'package:com.rado.valorant/views/widgets/default_border_radius.dart';
import 'package:com.rado.valorant/views/widgets/default_border.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildMapAndWeaponItem({
  required VoidCallback onClick,
  required String imageUrl,
  required String name,
  BoxFit? fit,
}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: defaultBorderRadius(),
    ),
    color: AppColors.transparent,
    child: InkWell(
      onTap: onClick,
      child: Container(
        height: 234.sp,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: AppColors.transparent,
          border: defaultBorder(),
          borderRadius: defaultBorderRadius(),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 234.sp,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: defaultBorderRadius(),
                child: Container(
                  height: 100.sp,
                  width: 100.sp,
                  child: buildCachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: fit ?? BoxFit.cover,
                    errorColor: AppColors.white,
                    placeholderColor: AppColors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: 30.sp,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: defaultBorderRadius(
                  bottomRight: 3.sp,
                  bottomLeft: 18.sp,
                ),
              ),
              child: Text(
                name,
                style: TextStyle(
                  color: AppColors.dark,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
