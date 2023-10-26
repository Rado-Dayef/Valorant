import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Border defaultBorder({
  Color? color,
  double? width,
}) {
  return Border.all(
    color: color ?? AppColors.white,
    width: width ?? 2.sp,
  );
}
