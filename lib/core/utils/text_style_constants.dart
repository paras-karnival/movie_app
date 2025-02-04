import 'package:flutter/material.dart';

//Info  get FontSize fontWeight color
class AppTextStyle {
  static const FontWeight semiBoldFontWeight = FontWeight.w600;
  static const FontWeight mediumFontWeight = FontWeight.w500;
  static const FontWeight regularFontWeight = FontWeight.w400;

  static TextStyle imageTitle = TextStyle(
    fontWeight: semiBoldFontWeight,
    fontSize: 16,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle imageOverlapTitle = TextStyle(
    fontWeight: semiBoldFontWeight,
    fontSize: 32,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle subTitle = TextStyle(
    fontWeight: regularFontWeight,
    fontSize: 12,
    overflow: TextOverflow.ellipsis,
  );
}
