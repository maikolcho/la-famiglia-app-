import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Insignia circular amarilla con ícono marrón, usada como elemento
/// visual destacado en pantallas informativas (mismo lenguaje que los
/// botones píldora del sitio real).
class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  const IconBadge({super.key, required this.icon, this.size = 140});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.accent,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: size * 0.5, color: AppColors.onAccent),
    );
  }
}
