import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/launch_helper.dart';
import '../widgets/app_scaffold.dart';

class CartaScreen extends StatelessWidget {
  const CartaScreen({super.key});

  static const _dishes = <_Dish>[
    _Dish('dish-la-rustichella.jpg', 'La Rustichella'),
    _Dish('dish-carpaccio-picana.jpg', 'Carpaccio de picaña'),
    _Dish('dish-tortilla-carbonara.jpg', 'Tortilla di patate alla carbonara'),
    _Dish('dish-croccante-capra.jpg', 'Croccante di capra'),
    _Dish('dish-ventresca-mandorle.jpg', 'Ventresca e mandorle'),
    _Dish('dish-risotto-nero.jpg', 'Risotto nero di calamaro con pulpo'),
    _Dish('dish-garganelli-gambero.jpg', 'Garganelli con gambero verde e rosso'),
    _Dish('dish-vera-carbonara.jpg', 'Vera Carbonara'),
    _Dish('dish-bravissima.jpg', 'Bravissima'),
    _Dish('dish-lasagna-verde.jpg', 'Lasagna verde tentazione'),
    _Dish('dish-cannelloni-ossobuco.jpg', 'Cannelloni con ossobuco e Idiazábal'),
    _Dish('dish-nostro-cannoli.jpg', 'Nostro cannoli'),
    _Dish('dish-tarta-queso.jpg', 'Tarta de queso al horno'),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      route: '/carta',
      title: 'Carta',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('NUESTRA CARTA', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 6),
          Text(
            'La pasta se hace en casa. Punto.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.78,
            ),
            itemCount: _dishes.length,
            itemBuilder: (context, index) {
              final dish = _dishes[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: GestureDetector(
                        onTap: () => _showDish(context, dish),
                        child: Image.asset(
                          'assets/images/${dish.image}',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    dish.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => launchExternalUrl('https://lafamigliarestaurantes.com/carta/'),
              icon: const Icon(Icons.open_in_new),
              label: const Text('Ver carta completa'),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  void _showDish(BuildContext context, _Dish dish) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: AppColors.background,
        insetPadding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: InteractiveViewer(
                child: Image.asset('assets/images/${dish.image}'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                dish.name,
                style: const TextStyle(
                  fontFamily: 'RobotoSlab',
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dish {
  final String image;
  final String name;

  const _Dish(this.image, this.name);
}
