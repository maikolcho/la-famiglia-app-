import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/launch_helper.dart';
import '../widgets/app_scaffold.dart';

class AsiSeViveScreen extends StatelessWidget {
  const AsiSeViveScreen({super.key});

  static const _values = ['Pasión', 'Creatividad', 'Innovación', 'Calidad', 'Experiencia'];

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyLarge;
    return AppScaffold(
      route: '/asi-se-vive',
      title: 'Así se vive',
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Image.asset('assets/images/sobre-se-vive.jpg', height: 220, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Aquí no solo se come.\nSe vive, se siente.', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 16),
                Text(
                  'Una escapada a Italia sin salir de tu ciudad, donde cada comida se convierte '
                  'en un encuentro con sentido. El tiempo se detiene y el sabor manda.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),
                Text('Más de 25 años de historia', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  'Una de las marcas de restauración italiana más reconocidas de España, '
                  'con presencia en España, Portugal y Andorra y miles de clientes fieles.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/images/sobre-gnocchi.jpg', height: 220, width: double.infinity, fit: BoxFit.cover),
                ),
                const SizedBox(height: 20),
                Text('Nuestros valores', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final value in _values)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          value,
                          style: const TextStyle(color: AppColors.onAccent, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/images/sobre-spritz.jpg', height: 220, width: double.infinity, fit: BoxFit.cover),
                ),
                const SizedBox(height: 20),
                Text('El jardín vertical', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  'Es el símbolo emblemático de la casa: un jardín vertical que acompaña '
                  'el espacio y marca la identidad visual de cada local.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 28),
                Center(
                  child: OutlinedButton.icon(
                    onPressed: () => launchExternalUrl('https://lafamigliarestaurantes.com/sobre-nosotros/'),
                    icon: const Icon(Icons.open_in_new),
                    label: const Text('Conoce más sobre nosotros'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
