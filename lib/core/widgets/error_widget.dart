import 'package:flutter/material.dart';
import 'package:quote_app/core/utils/app_colors.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primaryColor,
            size: 150,
          ),
        ),
        const Text(
          'Something went wrong',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const Text(
          'Please try again',
          style: TextStyle(
              color: AppColors.hint, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: 50,
          width: 200,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: const StadiumBorder(),
                foregroundColor: Colors.white,
                elevation: 500,
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              onPressed: onPressed,
              child: const Text(
                'Reload Screen',
                style: TextStyle(fontSize: 20),
              )),
        )
      ],
    );
  }
}
