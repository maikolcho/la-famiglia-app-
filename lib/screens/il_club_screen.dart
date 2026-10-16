import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/launch_helper.dart';
import '../widgets/app_scaffold.dart';

class IlClubScreen extends StatelessWidget {
  const IlClubScreen({super.key});

  static const _tiers = <_Tier>[
    _Tier('PRIMO', '0 – 3.000 puntos', ['5% dto. lunes a jueves', 'Bono bienvenida de 5€', 'Bono cumpleaños de 10€']),
    _Tier('SECONDO', '3.001 – 6.000 puntos', ['7% dto. lunes a jueves', 'Bono cumpleaños de 10€']),
    _Tier('TERZO', 'Más de 6.000 puntos', ['10% dto. lunes a jueves', 'Bono cumpleaños de 10€']),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      route: '/il-club',
      title: 'Il Club',
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/images/ilclub-experiencia.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cuanto más vienes, mejor sabe', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 10),
                Text(
                  'Gana 10 puntos por cada euro de consumo y canjéalos por recompensas, '
                  'sin perder tu nivel aunque los uses.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                for (final tier in _tiers) ...[
                  _TierCard(tier: tier),
                  const SizedBox(height: 12),
                ],
                const SizedBox(height: 12),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () => launchExternalUrl('https://lafamigliarestaurantes.com/il-club/'),
                    icon: const Icon(Icons.open_in_new),
                    label: const Text('Unirme a Il Club'),
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

class _Tier {
  final String name;
  final String range;
  final List<String> perks;

  const _Tier(this.name, this.range, this.perks);
}

class _TierCard extends StatelessWidget {
  final _Tier tier;

  const _TierCard({required this.tier});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.textPrimary.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                tier.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(width: 10),
              Text(tier.range, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 10),
          for (final perk in tier.perks)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle, size: 16, color: AppColors.accent),
                  const SizedBox(width: 8),
                  Expanded(child: Text(perk, style: Theme.of(context).textTheme.bodyLarge)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
