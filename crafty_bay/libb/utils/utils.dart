import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void showSnackBarMessage(BuildContext context, String message,
      [bool isError = false]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message), backgroundColor: isError ? Colors.red : null),
    );
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.blue,
        gravity: ToastGravity.BOTTOM //it will show in bottom
        );
  }
}
