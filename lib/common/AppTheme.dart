import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/AppColors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      textTheme: TextTheme(
          headlineSmall:
              TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400,),
          titleLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: Colors.white)),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          color: AppColors.mainColor,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(50)))));
}
