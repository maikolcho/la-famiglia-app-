import 'package:flutter/material.dart';
import 'app_drawer.dart';

/// Scaffold compartido por todas las pantallas: AppBar + Drawer consistentes.
class AppScaffold extends StatelessWidget {
  final String route;
  final String title;
  final Widget body;
  final List<Widget>? actions;

  const AppScaffold({
    super.key,
    required this.route,
    required this.title,
    required this.body,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      drawer: AppDrawer(currentRoute: route),
      body: body,
    );
  }
}
