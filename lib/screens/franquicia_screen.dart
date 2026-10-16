import 'package:flutter/material.dart';
import '../widgets/external_link_screen.dart';

class FranquiciaScreen extends StatelessWidget {
  const FranquiciaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExternalLinkScreen(
      route: '/franquicia',
      title: 'Abre tu Franquicia',
      icon: Icons.storefront_outlined,
      description:
          'Más de 85 locales en España, Andorra y Portugal. Inversión desde '
          '350.000€, entrada de 32.000€ + IVA y acompañamiento completo: '
          'formación, obrador propio y negociación con proveedores.',
      buttonLabel: 'Más información',
      url: 'https://lafamigliarestaurantes.com/franquicias/',
    );
  }
}
