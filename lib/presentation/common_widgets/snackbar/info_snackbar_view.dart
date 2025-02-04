
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

import '../text_view.dart';

infoSnackBarView({required String message})
{
  return   SnackBar(
    content: TextView(
      title: message,
      textColor: Colors.white,
      alignment: Alignment.center,
    ),
    duration: const Duration(seconds: 6),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: AppColors.primaryColor,
    // margin: const EdgeInsets.all(20),
    // shape: const StadiumBorder(),
  );
}