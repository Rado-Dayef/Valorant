import 'package:com.rado.valorant/views/widgets/default_border_radius.dart';
import 'package:com.rado.valorant/views/widgets/default_sized_boxes.dart';
import 'package:com.rado.valorant/views/widgets/default_border.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildCategoriesContainer({
  required String title,
  required String subTitle,
  double? fontSize,
  Color? backgroundColor,
  Color? borderColor,
  double? containerPadding,
}) {
  return subTitle != AppStrings.nullText
      ? Column(
          children: [
            defaultSizedBoxH10(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Container(
                padding: EdgeInsets.all(
                  containerPadding ?? 15.w,
                ),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: backgroundColor ?? AppColors.transparent,
                  border: defaultBorder(color: borderColor),
                  borderRadius: defaultBorderRadius(),
                ),
                child: RichText(
                  text: TextSpan(
                    text: title,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: fontSize ?? 14.sp,
                      fontFamily: AppStrings.valorantFont,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    children: [
                      TextSpan(
                        text: subTitle,
                        style: TextStyle(
                          color: AppColors.transparentWhite,
                          fontSize: 12.sp,
                          fontFamily: AppStrings.valorantFont,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      : Container(
          height: 0,
          width: 0,
        );
}
