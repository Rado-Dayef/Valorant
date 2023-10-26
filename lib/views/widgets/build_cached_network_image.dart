import 'package:com.rado.valorant/views/widgets/build_image_placeholder.dart';
import 'package:com.rado.valorant/views/widgets/build_image_error.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildCachedNetworkImage({
  required String imageUrl,
  required BoxFit fit,
  required Color errorColor,
  required Color placeholderColor,
  bool? justIconWhenError,
  double? topLeft,
  double? bottomLeft,
  double? bottomRight,
  double? topRight,
}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    filterQuality: FilterQuality.high,
    fit: fit,
    errorWidget: (buildContext, object, stackTrace) {
      return buildImageError(
        justIcon: justIconWhenError ?? false,
        textColor: errorColor,
        topRight: topRight,
        bottomRight: bottomRight,
        topLeft: topLeft,
        bottomLeft: bottomLeft,
      );
    },
    placeholder: (context, url) {
      return buildImagePlaceholder(
        backgroundColor: AppColors.transparent,
        indicatorColor: placeholderColor,
        topRight: topRight,
        bottomRight: bottomRight,
        topLeft: topLeft,
        bottomLeft: bottomLeft,
      );
    },
  );
}
