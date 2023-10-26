import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

CarouselOptions defaultCarouselOptions({
  double? height,
  double? viewportFraction,
  bool? autoPlay,
  bool? enlargeCenterPage,
  bool? enableInfiniteScroll,
}) {
  return CarouselOptions(
    height: height ?? double.infinity,
    viewportFraction: viewportFraction ?? 0.8,
    autoPlay: autoPlay ?? true,
    scrollPhysics: const BouncingScrollPhysics(),
    enableInfiniteScroll: enableInfiniteScroll ?? true,
    enlargeCenterPage: enlargeCenterPage ?? true,
    disableCenter: true,
    pageSnapping: true,
    autoPlayCurve: Curves.decelerate,
    autoPlayInterval: const Duration(
      seconds: 5,
    ),
    autoPlayAnimationDuration: const Duration(
      seconds: 2,
    ),
  );
}
