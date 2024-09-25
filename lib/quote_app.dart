import 'package:flutter/material.dart';
import 'package:quote_app/config/routes/app_routes.dart';
import 'package:quote_app/config/themes/app_them.dart';
import 'package:quote_app/core/utils/app_strings.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppThemes.blueAppThemeLight(),
      // home: const QuoteScreen(),

      // routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
