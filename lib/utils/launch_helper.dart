import 'package:url_launcher/url_launcher.dart';

/// Abre una URL externa (web, delivery, redes) en el navegador/app correspondiente.
Future<void> launchExternalUrl(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

/// Abre el marcador telefónico con el número indicado.
Future<void> launchPhoneCall(String phoneNumber) async {
  final uri = Uri(scheme: 'tel', path: phoneNumber);
  await launchUrl(uri);
}
