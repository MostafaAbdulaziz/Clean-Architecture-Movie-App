import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/constants_numbers.dart';

import 'core/utils/light.dart';
import 'movies/presentation/screens/movies_screen.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    ConstantNumbers.screenWidth = MediaQuery.of(context).size.width;
    ConstantNumbers.screenHeight = MediaQuery.of(context).size.height;
    return DevicePreview(
      enabled: false,
      builder:
          (context) => ScreenUtilInit(
            designSize: Size(
              ConstantNumbers.screenWidth,
              ConstantNumbers.screenHeight,
            ),
            minTextAdapt: true,
            splitScreenMode: true,
            enableScaleText: () => true,
            enableScaleWH: () => true,
            builder: (context, child) => _buildMaterialApp(),
          ),
    );
  }
}

Widget _buildMaterialApp() => MaterialApp(
  home: MoviesScreen(),
  debugShowCheckedModeBanner: false,
  theme: lightTheme(),
  darkTheme: ThemeData(),
  themeMode: ThemeMode.light,
);
