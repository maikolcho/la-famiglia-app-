import 'package:flutter/material.dart';
import '../widgets/external_link_screen.dart';

class TarjetaRegaloScreen extends StatelessWidget {
  const TarjetaRegaloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExternalLinkScreen(
      route: '/tarjeta-regalo',
      title: 'Tarjeta Regalo',
      icon: Icons.card_giftcard_outlined,
      description:
          'La pides en tu restaurante, le cargas el importe que quieras '
          'y la gastas cuando te dé la gana. Sin fecha de caducidad, pagando '
          'en efectivo o con tarjeta.',
      buttonLabel: 'Comprar tarjeta regalo',
      url: 'https://lafamigliarestaurantes.com/tarjeta-regalo-restaurante/',
    );
  }
}
