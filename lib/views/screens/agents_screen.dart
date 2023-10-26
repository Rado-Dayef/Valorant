import 'package:com.rado.valorant/views/widgets/build_decoration_cached_network_image.dart';
import 'package:com.rado.valorant/views/widgets/build_cached_network_image.dart';
import 'package:com.rado.valorant/views/widgets/default_carousel_options.dart';
import 'package:com.rado.valorant/views/widgets/default_border_radius.dart';
import 'package:com.rado.valorant/views/widgets/build_check_internet.dart';
import 'package:com.rado.valorant/controllers/home_controller.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentsScreen extends StatelessWidget {
  const AgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        if (controller.agents.isEmpty) {
          return buildCheckInternet();
        } else {
          return Center(
            child: CarouselSlider.builder(
              itemCount: controller.agents.length,
              options: defaultCarouselOptions(
                viewportFraction: 1.6,
                height: double.infinity,
                enlargeCenterPage: false,
              ),
              itemBuilder: (context, itemIndex, pageViewIndex) {
                final agent = controller.agents[itemIndex];
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      AppStrings.agentDetailsRout,
                      arguments: {
                        AppStrings.agentArgsText: agent,
                      },
                    );
                  },
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: "${AppStrings.agentNameTagText}${agent.displayName}",
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: defaultBorderRadius(),
                      ),
                      color: AppColors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.red,
                              AppColors.red,
                              AppColors.dark,
                            ],
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 100.sp,
                                width: double.infinity,
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  agent.displayName.toString(),
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 40.sp,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 500.h,
                              width: 350.w,
                              decoration: BoxDecoration(
                                image: buildDecorationCachedNetworkImage(
                                  imageUrl: agent.background.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: double.infinity,
                              width: double.infinity,
                              child: buildCachedNetworkImage(
                                imageUrl: agent.fullPortrait.toString(),
                                fit: BoxFit.fitWidth,
                                errorColor: AppColors.transparentWhite,
                                placeholderColor: AppColors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
