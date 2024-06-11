import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';

class MWKTheme {
  // Tamanho padrão do sistema
  double displayLarge = 56;
  double displayMedium = 44;
  double displaySmall = 36;
  double headlineLarge = 32;
  double headlineMedium = 28;
  double headlineSmall = 24;
  double iconSize = 24;
  double titleLarge = 22;
  double titleMedium = 18;
  double titleSmall = 14;
  double bodyLarge = 16;
  double bodyMedium = 14;
  double bodySmall = 12;
  double labelLarge = 16;
  double labelMedium = 14;
  double labelSmall = 12;

  static TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      height: 1.12,
    ),
    displayMedium: TextStyle(
      fontSize: 44,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.16,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.22,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.29,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.33,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.27,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.50,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      height: 1.43,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.43,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.40,
      height: 1.33,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.10,
      height: 1.43,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.33,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.45,
    ),
  );

  // Definição do tema claro
  static final ThemeData lightTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff1145a4),
      primaryContainer: Color(0xffacc7f6),
      secondary: Color(0xffb61d1d),
      secondaryContainer: Color(0xffec9f9f),
      tertiary: Color(0xff376bca),
      tertiaryContainer: Color(0xffcfdbf2),
      appBarColor: Color(0xffcfdbf2),
      error: Color(0xffb00020),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      textButtonRadius: 8.0,
      inputDecoratorIsFilled: false,
      inputDecoratorRadius: 16.0,
      inputDecoratorUnfocusedBorderIsColored: false,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
      appBarScrolledUnderElevation: 0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    appBarBackground: Colors.transparent,
    appBarElevation: 0,
    fontFamily: 'Roboto',
  );

  // Definição do tema escuro
  static final ThemeData darkTheme = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xffc4d7f8),
      primaryContainer: Color(0xff577cbf),
      secondary: Color(0xfff1bbbb),
      secondaryContainer: Color(0xffcb6060),
      tertiary: Color(0xffdde5f5),
      tertiaryContainer: Color(0xff7297d9),
      appBarColor: Color(0xffdde5f5),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      textButtonRadius: 8.0,
      inputDecoratorIsFilled: false,
      inputDecoratorRadius: 16.0,
      inputDecoratorUnfocusedBorderIsColored: false,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
      appBarScrolledUnderElevation: 0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    appBarBackground: Colors.transparent,
    appBarElevation: 0,
    fontFamily: 'Roboto',
  );

  /// Singleton factory
  static final MWKTheme _instance = MWKTheme._internal();

  factory MWKTheme() {
    return _instance;
  }

  MWKTheme._internal();
}
