import 'package:flutter/material.dart';

/// Paleta real extraída de lafamigliarestaurantes.com (CSS del sitio):
/// fondo crema cálido, texto marrón oscuro, acento amarillo en botones.
class AppColors {
  static const background = Color(0xFFFFFBF4);
  static const surface = Color(0xFFF5EEDF);
  static const accent = Color(0xFFFFE664);
  static const textPrimary = Color(0xFF462C29);
  static const textSecondary = Color(0xFF7A7A7A);
  static const onAccent = Color(0xFF462C29);
}

class AppTheme {
  static ThemeData get theme {
    final headingFont = 'RobotoSlab';
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme.light(
        surface: AppColors.surface,
        primary: AppColors.accent,
        onPrimary: AppColors.onAccent,
        secondary: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: headingFont,
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.background,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.onAccent,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: const StadiumBorder(),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.2),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.textPrimary, width: 1.4),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: const StadiumBorder(),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.2),
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontFamily: headingFont,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
        titleLarge: TextStyle(
          fontFamily: headingFont,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: const TextStyle(color: AppColors.textSecondary, height: 1.5),
        bodyLarge: const TextStyle(color: AppColors.textPrimary, height: 1.5),
      ),
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
    );
  }
}
