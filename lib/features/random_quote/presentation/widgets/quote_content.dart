import 'package:flutter/material.dart';
import 'package:quote_app/core/utils/app_colors.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key});

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
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Mostafa AbuBakr Ahmed Hamed Mostafa AbuBakr Ahmed Hamed Mostafa AbuBakr Ahmed Hamed Mostafa AbuBakr Ahmed Hamed Mostafa AbuBakr Ahmed Hamed',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Mostafa AbuBakr Ahmed Hamed',
              style: TextStyle(
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
