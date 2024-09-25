import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quote_app/core/utils/app_colors.dart';

class AppConstants {
  static void showErrorDialog({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            message,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                child: const Text('Ok')),
          ],
        );
      },
    );
  }

  static void showToast({required String message, Color? color}) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: color ?? AppColors.primaryColor,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }
}
