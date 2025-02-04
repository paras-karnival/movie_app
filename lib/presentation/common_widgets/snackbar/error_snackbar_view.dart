import 'package:flutter/material.dart';

import '../text_view.dart';


errorSnackBarView({required String message})
{
  return   SnackBar(
    content: TextView(
      title: message,
      textColor: Colors.white,
      alignment: Alignment.center,
    ),
    duration: const Duration(seconds: 6),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.red,
    // margin: const EdgeInsets.all(20),
    // shape: const StadiumBorder(),
  );
}