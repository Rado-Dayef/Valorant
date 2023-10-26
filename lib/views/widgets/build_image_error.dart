import 'package:com.rado.valorant/views/widgets/default_border_radius.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildImageError({
  required Color textColor,
  bool? justIcon,
  double? topRight,
  double? bottomRight,
  double? bottomLeft,
  double? topLeft,
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: defaultBorderRadius(
      topLeft: topLeft ?? 5.sp,
      bottomLeft: bottomLeft ?? 5.sp,
      bottomRight: bottomRight ?? 5.sp,
      topRight: topRight ?? 5.sp,
    )),
    child: SizedBox(
      width: 325.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: textColor,
            size: 50.sp,
          ),
          justIcon == false
              ? SizedBox(
                  height: 10.sp,
                )
              : SizedBox(),
          justIcon == false
              ? SizedBox(
                  width: 300.w,
                  child: Text(
                    AppStrings.imageErrorText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24.sp,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    ),
  );
}
