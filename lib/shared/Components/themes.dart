import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: "Arimo",
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0XFF313638),
    primary: const Color(0xFFFFF8F0), secondaryContainer: const Color(0xFFF7F0F0),
      primaryContainer: const Color(0xFF313638)).
  copyWith(background: const Color(0xFFFFFFFF)),
  textTheme: const TextTheme(displayLarge: TextStyle(color: Color(0xFF313638)),),
    useMaterial3: true,
);

ThemeData darkTheme1 = ThemeData(
  fontFamily: "Arimo",
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0XFF829399),
    primary: const Color(0xFF545F66), secondaryContainer: const Color(0XFF829399),
      primaryContainer: const Color(0xFFCDDDDD)).
  copyWith(background: const Color(0xFF404E4D)),
    textTheme: const TextTheme(displayLarge: TextStyle(color: Color(0xFFCDDDDD)),)
);

ThemeData darkTheme2 = ThemeData(
    fontFamily: "Arimo",
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0XFFC0C781),
        primary: const Color(0xFF131B23), secondaryContainer: const Color(0XFFC0C781),
        primaryContainer: const Color(0xFFCDDDDD)).
    copyWith(background: const Color(0xFF001011)),
    textTheme: const TextTheme(displayLarge: TextStyle(color: Color(0xFFCDDDDD)),)
);

ThemeData darkTheme3 = ThemeData(
    fontFamily: "Arimo",
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0XFF8AA1B1),
        primary: const Color(0xFF131B23), secondaryContainer: const Color(0XFF8AA1B1),
        primaryContainer: const Color(0xFFCDDDDD)).
    copyWith(background: const Color(0xFF001011)),
    textTheme: const TextTheme(displayLarge: TextStyle(color: Color(0xFFCDDDDD)),)
);

ThemeData darkTheme = ThemeData(
    fontFamily: "Arimo",
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0XFFE0E2DB),
        primary: const Color(0xFF131B23), secondaryContainer: const Color(0XFFE0E2DB ),
        primaryContainer: const Color(0xFFCDDDDD)).
    copyWith(background: const Color(0xFF001011)),
    textTheme: const TextTheme(displayLarge: TextStyle(color: Color(0xFFCDDDDD)),), useMaterial3: true
);