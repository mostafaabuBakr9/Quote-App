import 'package:flutter/material.dart';
import 'package:quote_app/core/utils/app_colors.dart';
import 'package:quote_app/features/random_quote/domain/entities/quote.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key, required this.quote});
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      // height: 300,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: AppColors.primaryColor),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              quote.content,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              quote.auther,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
