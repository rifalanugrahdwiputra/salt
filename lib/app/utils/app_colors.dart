import 'package:flutter/material.dart';

class AppColors {
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greyColor = Color(0xFF606060);
  static const Color bgColor = Color(0xFFF2F2F2);
  static const Color inputColor = Color(0xFFE8E8E8);
  static const Color navColor = Color(0xFFF9F9F9);
  static const Color appBarColor = Color(0xFFF9F9F9);
  static const Color shadowColor = Color(0xFF7090B0);
  static const Color imageBorderColor = Color(0xFFF1F1F1);
  static const Color alertSuccessColor = Color(0xFFd4edda);
  static const Color alertErrorColor = Color(0xFFf8d7da);
  static const Color textSuccessColor = Color(0xFF155724);
  static const Color textErrorColor = Color(0xFF721c24);

  static const Color blueAccentColor = Color(0xFF50A6C7);
  static const Color primaryColor = Color(0xFF18284C);
  static const Color cardColor = Color(0xFF1E3364);
  static const Color indicatorColor = Color(0xFFF7D18E);
  static const Color disableIndicatorColor = Color(0xFF2E486A);
  static const Color starColor = Color(0xFFF8D956);
  static const Color shareColor = Color(0xFF4694E8);
  static const Color percentEnableColor = Color(0xFF90C388);
  static const Color percentDisableColor = Color(0xFFD67976);
  static const Color trueQuestionColor = Color(0xFF547E63);
  static const Color falseQuestionColor = Color(0xFFB64741);

  static const Map<int, Color> colorMap = {
    50: Color(0xFF314e73),
    100: Color(0xFF314e73),
    200: Color(0xFF314e73),
    300: Color(0xFF314e73),
    400: Color(0xFF314e73),
    500: Color(colorPrimaryMaterial),
    600: Color(0xFF314e73),
    700: Color(0xFF314e73),
    800: Color(0xFF314e73),
    900: Color(0xFF314e73),
  };

  static const int colorPrimaryMaterial = 0xFF314e73;
  static const MaterialColor primaryMaterial =
      MaterialColor(colorPrimaryMaterial, colorMap);
}
