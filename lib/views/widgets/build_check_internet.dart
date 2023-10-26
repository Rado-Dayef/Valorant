import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildCheckInternet() {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        children: [
          CircularProgressIndicator(
            color: AppColors.white,
          ),
          SizedBox(
            height: 50.sp,
          ),
          Container(
            child: Text(
              AppStrings.checkYourInternetConnectionText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24.sp,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
