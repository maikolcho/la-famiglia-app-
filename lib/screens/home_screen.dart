import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/launch_helper.dart';
import '../widgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      route: '/',
      title: 'La Famiglia',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/hero-cordoba.jpg',
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 260,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Córdoba',
                        style: TextStyle(
                          fontFamily: 'RobotoSlab',
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Avda. Gran Capitán, 46',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Cocina italo-mediterránea en el centro de Córdoba, '
                    'en la Avenida Gran Capitán. Pasta, pizza, risotto y mucho más '
                    'en un espacio para 160 personas, con terraza y salón privado.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 28),
                  ElevatedButton.icon(
                    onPressed: () => launchExternalUrl(
                      'https://www.covermanager.com/reservation/module_restaurant/restaurante-lamafia-cordoba/spanish',
                    ),
                    icon: const Icon(Icons.event_seat_outlined),
                    label: const Text('Reservar mesa'),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () => launchExternalUrl(
                      'https://www.covermanager.com/go/restaurante-lamafia-cordoba/es',
                    ),
                    icon: const Icon(Icons.storefront_outlined),
                    label: const Text('Recoger en el local'),
                  ),
                  const SizedBox(height: 28),
                  Text('¿O te lo llevamos a casa?', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _DeliveryChip(
                          label: 'Glovo',
                          color: const Color(0xFFFFC244),
                          textColor: Colors.black,
                          onTap: () => launchExternalUrl(
                            'https://glovoapp.com/es/es/cordoba/la-mafia-se-sienta-a-la-mesa-9/',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _DeliveryChip(
                          label: 'Uber Eats',
                          color: const Color(0xFF06C167),
                          textColor: Colors.white,
                          onTap: () => launchExternalUrl(
                            'https://www.ubereats.com/es/store/la-mafia-se-sienta-a-la-mesa-cordoba/RvWEFc6zT5KN2Acn9zz4Mw',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _DeliveryChip(
                          label: 'Just Eat',
                          color: const Color(0xFFFF8000),
                          textColor: Colors.white,
                          onTap: () => launchExternalUrl(
                            'https://www.just-eat.es/restaurants-lamafiacordoba/menu',
                          ),
                        ),
                      ),
                    ],
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

class _DeliveryChip extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  const _DeliveryChip({
    required this.label,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
