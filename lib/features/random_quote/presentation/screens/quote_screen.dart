import 'package:flutter/material.dart';
import 'package:quote_app/core/utils/app_strings.dart';
import 'package:quote_app/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:quote_app/features/random_quote/presentation/widgets/quote_reload.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          QuoteContent(),
          SizedBox(
            height: 20,
          ),
          QuoteReload()
        ],
      ),
    );
  }
}
