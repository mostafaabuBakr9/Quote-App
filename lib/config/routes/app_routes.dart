import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quote_app/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:quote_app/features/splash_screen/presentation/screen/splash_screen.dart';
import 'package:quote_app/injection_container.dart' as di;

class AppRoutes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';

//for unknown route
  static Route onUnknownRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: Text(
                  'Page Not Found',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ));
  }

//generate route
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutes.randomQuoteRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => di.sl<RandomQuoteCubit>(),
                  child: const QuoteScreen(),
                ));
      default:
        return onUnknownRoute();
    }
  }
}
