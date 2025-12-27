import 'package:flutter/material.dart';

class ToastUtils {
  static void showToast(BuildContext context,{String? msg,int? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(msg ?? '刷新成功',textAlign: TextAlign.center,),
        duration: Duration(seconds: duration ?? 3),
      ),
    );
  }
}