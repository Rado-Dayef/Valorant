import 'package:com.rado.valorant/views/widgets/build_cached_network_image.dart';
import 'package:com.rado.valorant/views/widgets/build_carousel_slider_item.dart';
import 'package:com.rado.valorant/views/widgets/build_categories_container.dart';
import 'package:com.rado.valorant/views/widgets/default_carousel_options.dart';
import 'package:com.rado.valorant/views/widgets/default_box_decoration.dart';
import 'package:com.rado.valorant/views/widgets/default_sized_boxes.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/models/category_translator.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeaponDetailsScreen extends StatelessWidget {
  const WeaponDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final weapon = args[AppStrings.weaponArgsText];
    final itemIndex = args[AppStrings.itemIndexArgsText];
    final category = "${weapon.category}";
    final runSpeedMultiplier = "${weapon.weaponStats?[AppStrings.runSpeedMultiplierModelsText]}";
    final reloadTimeSeconds = "${weapon.weaponStats?[AppStrings.reloadTimeSecondsModelsText]}";
    final equipTimeSeconds = "${weapon.weaponStats?[AppStrings.equipTimeSecondsModelsText]}";
    final firstBulletAccuracy = "${weapon.weaponStats?[AppStrings.firstBulletAccuracyModelsText]}";
    final shotgunPelletCount = "${weapon.weaponStats?[AppStrings.shotgunPelletCountModelsText]}";
    final magazineSize = "${weapon.weaponStats?[AppStrings.magazineSizeModelsText]}";
    final fireRate = "${weapon.weaponStats?[AppStrings.fireRateModelsText]}";
    final rangeStartMeters = "${weapon.weaponStats?[AppStrings.damageRangesModelsText][0][AppStrings.rangeStartMetersModelsText]}";
    final rangeEndMeters = "${weapon.weaponStats?[AppStrings.damageRangesModelsText][0][AppStrings.rangeEndMetersModelsText]}";
    final headDamage = "${weapon.weaponStats?[AppStrings.damageRangesModelsText][0][AppStrings.headDamageModelsText]}";
    final bodyDamage = "${weapon.weaponStats?[AppStrings.damageRangesModelsText][0][AppStrings.bodyDamageModelsText]}";
    final legDamage = "${weapon.weaponStats?[AppStrings.damageRangesModelsText][0][AppStrings.legDamageModelsText]}";

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
                backgroundColor: Colors.transparent,
                floating: false,
                pinned: false,
                elevation: 0,
                expandedHeight: 350.sp,
                leading: Container(),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: "${weapon.displayName}${AppStrings.weaponNumberTagText}$itemIndex",
                      child: buildCachedNetworkImage(
                        imageUrl: weapon.displayIcon ?? AppStrings.emptyText,
                        fit: BoxFit.contain,
                        errorColor: AppColors.transparent,
                        placeholderColor: AppColors.transparent,
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
                          weapon.displayName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 40.sp,
                          ),
                        ),
                      ),
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.infoTitleText,
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      subTitle: AppStrings.emptyText,
                      containerPadding: 0.w,
                      fontSize: 16.sp,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.weaponCategoryTitleText,
                      subTitle: category.CategoriesTranslator,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.runSpeedMultiplierTitleText,
                      subTitle: runSpeedMultiplier,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.reloadTimeSecondsTitleText,
                      subTitle: reloadTimeSeconds,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.equipTimeSecondsTitleText,
                      subTitle: equipTimeSeconds,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.firstBulletAccuracyTitleText,
                      subTitle: firstBulletAccuracy,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.shotgunPelletCountTitleText,
                      subTitle: shotgunPelletCount,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.magazineSizeTitleText,
                      subTitle: magazineSize,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.fireRateTitleText,
                      subTitle: fireRate,
                    ),
                    rangeStartMeters != AppStrings.nullText &&
                            rangeEndMeters != AppStrings.nullText &&
                            headDamage != AppStrings.nullText &&
                            bodyDamage != AppStrings.nullText &&
                            legDamage != AppStrings.nullText
                        ? buildCategoriesContainer(
                            title: AppStrings.damageRangesTitleText,
                            backgroundColor: Colors.transparent,
                            borderColor: Colors.transparent,
                            subTitle: AppStrings.emptyText,
                            containerPadding: 0.w,
                            fontSize: 16.sp,
                          )
                        : Container(),
                    buildCategoriesContainer(
                      title: AppStrings.rangeStartMetersTitleText,
                      subTitle: rangeStartMeters,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.rangeEndMetersTitleText,
                      subTitle: rangeEndMeters,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.headDamageTitleText,
                      subTitle: headDamage,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.bodyDamageTitleText,
                      subTitle: bodyDamage,
                    ),
                    buildCategoriesContainer(
                      title: AppStrings.legDamageTitleText,
                      subTitle: legDamage,
                    ),
                    Column(
                      children: [
                        buildCategoriesContainer(
                          title: AppStrings.skinsTitleText,
                          backgroundColor: AppColors.transparent,
                          borderColor: AppColors.transparent,
                          subTitle: AppStrings.emptyText,
                          containerPadding: 0.w,
                          fontSize: 16.sp,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CarouselSlider.builder(
                          itemCount: weapon.skins?.length ?? 0,
                          options: defaultCarouselOptions(
                            height: 180.sp,
                            autoPlay: false,
                            enableInfiniteScroll: false,
                          ),
                          itemBuilder: (context, itemIndex, pageViewIndex) {
                            final skin = weapon.skins![itemIndex];
                            return Hero(
                              transitionOnUserGestures: true,
                              tag: "${skin.displayName}${AppStrings.skinNumberTagText}$itemIndex",
                              child: buildCarouselSliderItem(
                                onClick: () {
                                  Get.toNamed(
                                    AppStrings.weaponSkinDetailsRout,
                                    arguments: {
                                      AppStrings.skinArgsText: skin,
                                      AppStrings.itemIndexArgsText: itemIndex,
                                    },
                                  );
                                },
                                imageUrl: skin.displayIcon,
                                name: skin.displayName,
                              ),
                            );
                          },
                        ),
                      ],
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
