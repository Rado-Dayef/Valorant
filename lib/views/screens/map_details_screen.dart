import 'package:com.rado.valorant/views/widgets/build_cached_network_image.dart';
import 'package:com.rado.valorant/views/widgets/build_categories_container.dart';
import 'package:com.rado.valorant/views/widgets/default_box_decoration.dart';
import 'package:com.rado.valorant/views/widgets/default_border_radius.dart';
import 'package:com.rado.valorant/views/widgets/build_read_more_text.dart';
import 'package:com.rado.valorant/views/widgets/default_sized_boxes.dart';
import 'package:com.rado.valorant/views/widgets/default_border.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapDetailsScreen extends StatelessWidget {
  const MapDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final map = args[AppStrings.mapArgsText];
    final itemIndex = args[AppStrings.itemIndexArgsText];
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: defaultBoxDecoration(),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar.large(
                backgroundColor: AppColors.transparent,
                floating: false,
                pinned: false,
                elevation: 0,
                expandedHeight: 350.sp,
                leading: Container(),
                flexibleSpace: FlexibleSpaceBar(
                  background: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.sp),
                      ),
                      child: buildCachedNetworkImage(
                        imageUrl: map.displayIcon ?? AppStrings.emptyText,
                        fit: BoxFit.cover,
                        errorColor: AppColors.transparentWhite,
                        placeholderColor: AppColors.transparentWhite,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Center(
                        child: Text(
                          map.displayName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 40.sp,
                          ),
                        ),
                      ),
                    ),
                    defaultSizedBoxH25(),
                    buildCategoriesContainer(
                      title: AppStrings.coordinatesTitleText,
                      subTitle: map.coordinates ?? AppStrings.notAvailableText,
                    ),
                    defaultSizedBoxH10(),
                    buildCategoriesContainer(
                      title: AppStrings.mapDescriptionTitleText,
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      subTitle: AppStrings.emptyText,
                      containerPadding: 0.w,
                    ),
                    defaultSizedBoxH10(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: buildReadMoreText(
                        text: map.narrativeDescription ?? AppStrings.notAvailableText,
                        size: 14.sp,
                      ),
                    ),
                    defaultSizedBoxH10(),
                    Center(
                      child: Hero(
                        transitionOnUserGestures: true,
                        tag: "${map.displayName}${AppStrings.mapNumberTagText}$itemIndex",
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: defaultBorderRadius(),
                          ),
                          child: Container(
                            height: 225.sp,
                            width: 325.sp,
                            decoration: BoxDecoration(
                              color: AppColors.dark,
                              borderRadius: defaultBorderRadius(),
                              border: defaultBorder(
                                width: 1.sp,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: defaultBorderRadius(),
                              child: buildCachedNetworkImage(
                                imageUrl: map.splash ?? AppStrings.emptyText,
                                fit: BoxFit.cover,
                                errorColor: AppColors.transparentWhite,
                                placeholderColor: AppColors.transparentWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    defaultSizedBoxH25(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
