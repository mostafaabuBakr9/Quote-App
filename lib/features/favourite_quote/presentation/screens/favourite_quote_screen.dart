import 'package:flutter/material.dart';
import 'package:quote_app/core/utils/app_constants.dart';

class FavouriteQuoteScreen extends StatelessWidget {
  const FavouriteQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            AppConstants.showToast(
                message: 'this is a test message', color: Colors.red);
          },
          child: const Text(
            'Favourite Quote Screen',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
