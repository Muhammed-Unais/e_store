import 'package:e_store/res/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Utils {
  void showSnackBar(BuildContext context,
      {required void Function() onPressed,
      required String content,
      String? actionLabel}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.lightIconsColor,
        content: Text('$content added to cart'),
        duration: const Duration(seconds: 3),
        action: actionLabel == null
            ? null
            : SnackBarAction(
                label: actionLabel,
                onPressed: onPressed,
                textColor: Colors.white,
              ),
      ),
    );
  }
}
