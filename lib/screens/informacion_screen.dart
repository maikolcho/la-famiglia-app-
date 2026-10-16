import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../theme/app_theme.dart';
import '../utils/launch_helper.dart';
import '../widgets/app_scaffold.dart';

class InformacionScreen extends StatelessWidget {
  const InformacionScreen({super.key});

  static const _restaurantLocation = LatLng(37.892702, -4.783039);

  static const _reviews = <_Review>[
    _Review('Laura Bueno H.', 'Hemos cenado fenomenal. Todos los platos riquísimos. Nos ha atendido Javier con una profesionalidad impecable. Volveremos más veces.'),
    _Review('Cristina Cruces G.', 'Un restaurante precioso, con un ambiente encantador y una comida realmente espectacular. Los risottos son simplemente increíbles.'),
    _Review('Mateo G.', 'Muy buena experiencia. La comida estaba muy rica, con productos de calidad y un ambiente muy agradable. El trato del personal también fue excelente.'),
  ];

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyLarge;
    return AppScaffold(
      route: '/informacion',
      title: 'Información',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Restaurante Italiano Córdoba', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          const _InfoRow(
            icon: Icons.location_on_outlined,
            label: 'Dirección',
            value: 'Avda. Gran Capitán, 46, 14008 Córdoba',
          ),
          const _InfoRow(
            icon: Icons.phone_outlined,
            label: 'Teléfono',
            value: '682 681 485 / 656 538 576',
          ),
          const _InfoRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: 'cordoba@lafamigliarestaurantes.com',
          ),
          const _InfoRow(
            icon: Icons.schedule_outlined,
            label: 'Horario',
            value: 'Lunes a viernes: 13:30–16:00h y 20:30–00:00h',
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.textPrimary.withValues(alpha: 0.12)),
            ),
            child: Text(
              'Disfruta de una gran experiencia con nosotros ya sea en nuestra terraza '
              'o en nuestro salón privado, con capacidad para 20 personas.',
              style: bodyStyle,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => launchPhoneCall('682681485'),
                  icon: const Icon(Icons.call_outlined),
                  label: const Text('Llamar'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => launchExternalUrl(
                    'https://www.google.com/maps/search/?api=1&query=37.892702,-4.783039',
                  ),
                  icon: const Icon(Icons.directions_outlined),
                  label: const Text('Cómo llegar'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 320,
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: _restaurantLocation,
                  zoom: 15,
                ),
                markers: {
                  const Marker(
                    markerId: MarkerId('la_famiglia_cordoba'),
                    position: _restaurantLocation,
                    infoWindow: InfoWindow(title: 'La Famiglia se sienta a la mesa'),
                  ),
                },
                zoomControlsEnabled: true,
              ),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Restaurante italiano con terraza en Córdoba',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Text(
            '¡Disfruta de la mejor cocina italo-mediterránea en nuestro restaurante '
            'italiano de Córdoba! Ubicado en el centro de la ciudad, en la avenida '
            'Gran Capitán, ofrecemos la mayor variedad de pasta, pizza, risotto y '
            'especialidades en un local con capacidad para 160 personas y amplia terraza.',
            style: bodyStyle,
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Text('4.2', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (i) => Icon(
                        i < 4 ? Icons.star : Icons.star_half,
                        size: 18,
                        color: AppColors.accent,
                      ),
                    ),
                  ),
                  const Text(
                    'Basado en 3.124 opiniones de Google',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          for (final review in _reviews) ...[
            _ReviewCard(review: review),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.textPrimary, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                Text(value, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Review {
  final String name;
  final String text;

  const _Review(this.name, this.text);
}

class _ReviewCard extends StatelessWidget {
  final _Review review;

  const _ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textPrimary.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  review.name,
                  style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (i) => const Icon(Icons.star, size: 13, color: AppColors.accent),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(review.text, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }
}
