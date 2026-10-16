import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/launch_helper.dart';

class AppDrawer extends StatelessWidget {
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  static const _items = <_DrawerItem>[
    _DrawerItem('/', 'Inicio', Icons.home_outlined),
    _DrawerItem('/carta', 'Carta', Icons.menu_book_outlined),
    _DrawerItem('/menus', 'Menús', Icons.groups_outlined),
    _DrawerItem('/informacion', 'Información', Icons.info_outline),
    _DrawerItem('/galeria', 'Galería', Icons.photo_library_outlined),
    _DrawerItem('/asi-se-vive', 'Así se vive', Icons.local_dining_outlined),
    _DrawerItem('/il-club', 'Il Club', Icons.card_membership_outlined),
    _DrawerItem('/tarjeta-regalo', 'Tarjeta Regalo', Icons.card_giftcard_outlined),
    _DrawerItem('/franquicia', 'Abre tu Franquicia', Icons.storefront_outlined),
    _DrawerItem('/blog', 'Blog', Icons.article_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32),
              alignment: Alignment.center,
              color: AppColors.background,
              child: Image.asset(
                'assets/images/logo_dark.png',
                height: 70,
                errorBuilder: (_, _, _) => const Text(
                  'La Famiglia',
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Divider(color: AppColors.surface, height: 1),
            const SizedBox(height: 8),
            for (final item in _items)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Material(
                  color: item.route == currentRoute ? AppColors.accent : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    leading: Icon(item.icon, color: AppColors.textPrimary),
                    title: Text(
                      item.label,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: item.route == currentRoute ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      if (item.route != currentRoute) {
                        Navigator.pushReplacementNamed(context, item.route);
                      }
                    },
                  ),
                ),
              ),
            const SizedBox(height: 12),
            const Divider(color: AppColors.surface, height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialIcon(
                    icon: Icons.camera_alt_outlined,
                    url: 'https://www.instagram.com/lafamiglia.restaurantes/',
                  ),
                  _SocialIcon(
                    icon: Icons.facebook,
                    url: 'https://www.facebook.com/lafamigliarestaurantes',
                  ),
                  _SocialIcon(
                    icon: Icons.play_circle_outline,
                    url: 'https://www.youtube.com/user/MafiaRestaurantes',
                  ),
                  _SocialIcon(
                    icon: Icons.music_note_outlined,
                    url: 'https://www.tiktok.com/@lafamigliarestaurantes',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => launchExternalUrl(url),
      icon: Icon(icon, color: AppColors.textPrimary),
    );
  }
}

class _DrawerItem {
  final String route;
  final String label;
  final IconData icon;

  const _DrawerItem(this.route, this.label, this.icon);
}
