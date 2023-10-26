import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

BoxDecoration defaultBoxDecoration({
  List<Color>? colors,
}) {
  return BoxDecoration(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(10.sp),
    ),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: colors ??
          [
            AppColors.red,
            AppColors.red,
            AppColors.dark,
          ],
    ),
  );
}
