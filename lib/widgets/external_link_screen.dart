import 'package:flutter/material.dart';
import '../utils/launch_helper.dart';
import 'app_scaffold.dart';
import 'icon_badge.dart';

/// Pantalla informativa que resume una sección real del sitio y enlaza
/// a la página oficial para la funcionalidad completa (club, tarjeta regalo,
/// franquicias, blog), que no se reimplementa dentro de la app.
class ExternalLinkScreen extends StatelessWidget {
  final String route;
  final String title;
  final IconData icon;
  final String description;
  final String buttonLabel;
  final String url;

  const ExternalLinkScreen({
    super.key,
    required this.route,
    required this.title,
    required this.icon,
    required this.description,
    required this.buttonLabel,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      route: route,
      title: title,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconBadge(icon: icon),
              const SizedBox(height: 24),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              ElevatedButton.icon(
                onPressed: () => launchExternalUrl(url),
                icon: const Icon(Icons.open_in_new),
                label: Text(buttonLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
