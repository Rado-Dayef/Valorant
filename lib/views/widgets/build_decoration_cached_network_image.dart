import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

DecorationImage buildDecorationCachedNetworkImage({
  required String imageUrl,
  BoxFit? fit,
}) {
  return DecorationImage(
    image: CachedNetworkImageProvider(imageUrl),
    filterQuality: FilterQuality.high,
    fit: fit ?? BoxFit.fitWidth,
    opacity: 0.5,
  );
}
