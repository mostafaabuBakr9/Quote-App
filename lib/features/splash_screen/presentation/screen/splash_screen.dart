import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/config/routes/app_routes.dart';
import 'package:quote_app/core/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  goNext() =>
      Navigator.pushReplacementNamed(context, AppRoutes.randomQuoteRoute);

  late Timer timer;
  startDelay() {
    timer = Timer(const Duration(seconds: 2), () {
      goNext();
    });
  }

  @override
  void initState() {
    startDelay();

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.quote2x),
      ),
    );
  }
}
