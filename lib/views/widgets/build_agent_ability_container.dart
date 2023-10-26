import 'package:com.rado.valorant/views/widgets/build_image_placeholder.dart';
import 'package:com.rado.valorant/views/widgets/build_read_more_text.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildAgentAbilityContainer({
  required String abilityIcon,
  required String abilityName,
  required String abilityDescription,
}) {
  return ListTile(
    leading: CircleAvatar(
      child: CachedNetworkImage(
        imageUrl: abilityIcon,
        placeholder: (context, url) {
          return buildImagePlaceholder(
            backgroundColor: AppColors.transparent,
            indicatorColor: AppColors.transparentWhite,
          );
        },
        errorWidget: (buildContext, object, stackTrace) {
          return Icon(
            Icons.error_outline_rounded,
            color: AppColors.transparentWhite,
            size: 24.sp,
          );
        },
      ),
    ),
    title: Text(
      abilityName,
      style: TextStyle(
        color: AppColors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: buildReadMoreText(
      text: abilityDescription,
      size: 12.sp,
    ),
  );
}
