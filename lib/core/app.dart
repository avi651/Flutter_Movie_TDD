import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/app_strings.dart';
import 'package:movie_app/app/app_theme.dart';
import 'package:movie_app/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (BuildContext context, Widget? child) {
                return MaterialApp.router(
                  title: AppStrings.appName,
                  darkTheme: AppTheme.darkTheme,
                  theme: AppTheme.lightTheme,
                  //themeMode: state.currentTheme,
                  routerDelegate: AppRouter.router.routerDelegate,
                  routeInformationParser:
                      AppRouter.router.routeInformationParser,
                  routeInformationProvider:
                      AppRouter.router.routeInformationProvider,
                  debugShowCheckedModeBanner: false,
                );
              });
  }
}


