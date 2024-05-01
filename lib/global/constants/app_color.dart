// App Colors

import 'package:flutter/material.dart';

class AppColor {
  static const black = Color(0xff000000);
  static const white = Color(0xFFFFFFFF);
  static const blue = Color(0xFF1269B0);

  static const transparent = Colors.transparent;
  static const grey = Colors.grey;
  static const red = Colors.red;
  static const green = Colors.green;

  // Hexadecimal Color
  static Color hexGrey = fromHex('#121212');

  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFF8DEC3),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFDB7424),
    900: Color(0xFFD56217)
  };

  static Color fromHex(
    String hexString,
  ) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write(
        'ff',
      );
    }
    buffer.write(
      hexString.replaceFirst(
        '#',
        '',
      ),
    );
    return Color(
      int.parse(
        buffer.toString(),
        radix: 16,
      ),
    );
  }

  static LinearGradient getGradient(
    Color colorStart,
    Color colorEnd,
  ) {
    return LinearGradient(
      colors: [colorStart, colorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
