import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_scaffold.dart';

class GaleriaScreen extends StatelessWidget {
  const GaleriaScreen({super.key});

  static const _photos = [
    'cordoba-02.jpg',
    'cordoba-04.jpg',
    'cordoba-05.jpg',
    'cordoba-06.jpg',
    'cordoba-07.jpg',
    'cordoba-08.jpg',
    'cordoba-09.jpg',
    'cordoba-10.jpg',
    'cordoba-11.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      route: '/galeria',
      title: 'Galería',
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: _photos.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GestureDetector(
              onTap: () => _showFullImage(context, _photos[index]),
              child: Image.asset(
                'assets/images/${_photos[index]}',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  void _showFullImage(BuildContext context, String fileName) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: AppColors.background,
        child: InteractiveViewer(
          child: Image.asset('assets/images/$fileName'),
        ),
      ),
    );
  }
}
