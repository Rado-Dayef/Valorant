import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

BorderRadius defaultBorderRadius({
  double? topRight,
  double? bottomRight,
  double? bottomLeft,
  double? topLeft,
}) {
  return BorderRadius.only(
    topRight: Radius.circular(topRight ?? 20.sp),
    bottomRight: Radius.circular(bottomRight ?? 5.sp),
    bottomLeft: Radius.circular(bottomLeft ?? 20.sp),
    topLeft: Radius.circular(topLeft ?? 5.sp),
  );
}
