import 'package:flutter/material.dart';
import 'package:quote_app/features/favourite_quote/presentation/screens/favourite_quote_screen.dart';
import 'package:quote_app/features/random_quote/presentation/screens/quote_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String favouriteRoute = '/favouritequotes';
//Named Route
  static final routes = {
    AppRoutes.initialRoute: (context) => const QuoteScreen(),
    AppRoutes.favouriteRoute: (context) => const FavouriteQuoteScreen(),
  };
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
        return MaterialPageRoute(builder: (context) => const QuoteScreen());
      case AppRoutes.favouriteRoute:
        return MaterialPageRoute(
            builder: (context) => const FavouriteQuoteScreen());
      default:
        return onUnknownRoute();
    }
  }
}
