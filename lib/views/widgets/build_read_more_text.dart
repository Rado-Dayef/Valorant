import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';

Widget buildReadMoreText({
  required String text,
  required double size,
}) {
  return ReadMoreText(
    text,
    textAlign: TextAlign.justify,
    trimLines: 3,
    trimMode: TrimMode.Line,
    trimCollapsedText: AppStrings.showMoreText,
    trimExpandedText: AppStrings.showLessText,
    style: TextStyle(
      color: AppColors.white,
      fontSize: size,
    ),
    moreStyle: TextStyle(
      color: AppColors.white,
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    ),
    lessStyle: TextStyle(
      color: AppColors.white,
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    ),
  );
}
