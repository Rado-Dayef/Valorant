import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:com.rado.valorant/views/constants/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(350, 700),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: AppStrings.appName,
          theme: ThemeData(
            primarySwatch: AppColors.defaultColor,
            highlightColor: AppColors.transparent,
            splashColor: AppColors.transparent,
            canvasColor: AppColors.dark,
            fontFamily: AppStrings.valorantFont,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: AppStrings.splashRout,
          getPages: appPages(),
        );
      },
    );
  }
}
