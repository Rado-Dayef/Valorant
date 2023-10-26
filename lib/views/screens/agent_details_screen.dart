import 'package:com.rado.valorant/views/widgets/build_decoration_cached_network_image.dart';
import 'package:com.rado.valorant/views/widgets/build_agent_ability_container.dart';
import 'package:com.rado.valorant/views/widgets/build_cached_network_image.dart';
import 'package:com.rado.valorant/views/widgets/build_categories_container.dart';
import 'package:com.rado.valorant/views/widgets/default_box_decoration.dart';
import 'package:com.rado.valorant/views/widgets/build_read_more_text.dart';
import 'package:com.rado.valorant/views/widgets/default_sized_boxes.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentDetailsScreen extends StatelessWidget {
  const AgentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final agent = args[AppStrings.agentArgsText];
    return Scaffold(
      backgroundColor: AppColors.dark,
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
                  background: Stack(
                    alignment: Alignment.center,
                    children: [
                      Hero(
                        transitionOnUserGestures: true,
                        tag: "${AppStrings.agentNameTagText}${agent.displayName}",
                        child: Card(
                          elevation: 0,
                          color: AppColors.transparent,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: buildDecorationCachedNetworkImage(
                                imageUrl: agent.background ?? AppStrings.emptyText,
                              ),
                            ),
                            child: buildCachedNetworkImage(
                              imageUrl: agent.fullPortrait ?? AppStrings.emptyText,
                              fit: BoxFit.fitHeight,
                              errorColor: AppColors.white,
                              placeholderColor: AppColors.transparentWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                          agent.displayName,
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
                      title: AppStrings.roleTitleText,
                      subTitle: agent.role?.displayName ?? AppStrings.notAvailableText,
                    ),
                    defaultSizedBoxH10(),
                    buildCategoriesContainer(
                      title: AppStrings.agentDescriptionTitleText,
                      backgroundColor: Colors.transparent,
                      subTitle: AppStrings.emptyText,
                      borderColor: Colors.transparent,
                      containerPadding: 0.w,
                      fontSize: 16.sp,
                    ),
                    defaultSizedBoxH10(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: buildReadMoreText(
                        text: agent.description ?? AppStrings.notAvailableText,
                        size: 14.sp,
                      ),
                    ),
                    defaultSizedBoxH10(),
                    agent.abilities?.length != null ? buildCategoriesContainer(
                      title: AppStrings.abilitiesTitleText,
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      subTitle: AppStrings.emptyText,
                      containerPadding: 0.w,
                      fontSize: 16.sp,
                    ):Container(),
                    defaultSizedBoxH10(),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: agent.abilities?.length ?? 0,
                      itemBuilder: (context, index) {
                        final ability = agent.abilities![index];
                        return buildAgentAbilityContainer(
                          abilityIcon: ability.displayIcon ?? AppStrings.notAvailableText,
                          abilityName: ability.displayName,
                          abilityDescription: ability.description,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: AppColors.transparentWhite,
                          thickness: 1.sp,
                          height: 25.sp,
                          indent: 10.w,
                          endIndent: 10.w,
                        );
                      },
                    ),
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
