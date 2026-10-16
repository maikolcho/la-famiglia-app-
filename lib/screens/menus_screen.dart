import 'package:flutter/material.dart';
import '../utils/launch_helper.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/icon_badge.dart';

class MenusScreen extends StatelessWidget {
  const MenusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      route: '/menus',
      title: 'Menús',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const IconBadge(icon: Icons.groups_outlined),
              const SizedBox(height: 24),
              Text(
                'Menús para grupos y eventos',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Reservas y disponibilidad a confirmar previamente con el restaurante.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              ElevatedButton.icon(
                onPressed: () => launchExternalUrl(
                  'https://lafamigliarestaurantes.com/documentos/menu/Menu-2026-eventos-y-grupos-tn.pdf',
                ),
                icon: const Icon(Icons.picture_as_pdf_outlined),
                label: const Text('Ver menús'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => launchExternalUrl('https://lafamigliarestaurantes.com/menu-navidad-tn'),
                icon: const Icon(Icons.celebration_outlined),
                label: const Text('Menú de Navidad'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
