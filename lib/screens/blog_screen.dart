import 'package:flutter/material.dart';
import '../widgets/external_link_screen.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExternalLinkScreen(
      route: '/blog',
      title: 'Blog',
      icon: Icons.article_outlined,
      description:
          'Recetas, novedades y el día a día de La Famiglia, '
          'contado en nuestro blog.',
      buttonLabel: 'Ir al blog',
      url: 'https://lafamigliarestaurantes.com/blog/',
    );
  }
}
