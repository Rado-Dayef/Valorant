import 'package:com.rado.valorant/views/widgets/default_border_radius.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildImagePlaceholder({
  required Color backgroundColor,
  required Color indicatorColor,
  double? topRight,
  double? bottomRight,
  double? bottomLeft,
  double? topLeft,
}) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: defaultBorderRadius(
        topRight: topRight ?? 5.sp,
        bottomRight: bottomRight ?? 5.sp,
        bottomLeft: bottomLeft ?? 5.sp,
        topLeft: topLeft ?? 5.sp,
      ),
      color: backgroundColor,
    ),
    child: SizedBox(
      height: 100,
      width: 100,
      child: Center(
        child: CircularProgressIndicator(
          color: indicatorColor,
        ),
      ),
    ),
  );
}
