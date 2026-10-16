import 'package:flutter/material.dart';
import 'screens/asi_se_vive_screen.dart';
import 'screens/blog_screen.dart';
import 'screens/carta_screen.dart';
import 'screens/franquicia_screen.dart';
import 'screens/galeria_screen.dart';
import 'screens/home_screen.dart';
import 'screens/il_club_screen.dart';
import 'screens/informacion_screen.dart';
import 'screens/menus_screen.dart';
import 'screens/tarjeta_regalo_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const LaFamigliaApp());
}

class LaFamigliaApp extends StatelessWidget {
  const LaFamigliaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Famiglia',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/carta': (_) => const CartaScreen(),
        '/menus': (_) => const MenusScreen(),
        '/informacion': (_) => const InformacionScreen(),
        '/galeria': (_) => const GaleriaScreen(),
        '/asi-se-vive': (_) => const AsiSeViveScreen(),
        '/il-club': (_) => const IlClubScreen(),
        '/tarjeta-regalo': (_) => const TarjetaRegaloScreen(),
        '/franquicia': (_) => const FranquiciaScreen(),
        '/blog': (_) => const BlogScreen(),
      },
    );
  }
}
