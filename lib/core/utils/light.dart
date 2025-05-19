import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme() => ThemeData(
  textTheme: TextTheme(
    labelMedium: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
    labelSmall: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.2.w,
    ),
    bodyMedium: TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5.w,
    ),
  ),
);
