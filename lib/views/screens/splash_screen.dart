import 'package:com.rado.valorant/controllers/splash_controller.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 2.sp,
          ),
          decoration: BoxDecoration(
            // color: AppColors.light,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15.sp),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: 700.h,
                width: 350.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Obx(
                          () {
                            return Lottie.asset(
                              AppStrings.splashJson,
                              animate: controller.animate.value,
                            );
                          },
                        );
                      },
                    ),
                    Container(
                      height: 100.sp,
                      width: 100.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        image: const DecorationImage(
                          image: AssetImage(AppStrings.logoImage),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
