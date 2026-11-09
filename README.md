# La Famiglia

App multiplataforma (Android e iOS) hecha con Flutter para Restaurantes La Famiglia, en Córdoba. Reúne la carta, los menús, la galería del local, un club de fidelidad por niveles y la tarjeta regalo, con accesos directos a la reserva de mesa, la ubicación y el teléfono del restaurante.

## Funciones

- **Inicio** con accesos rápidos a carta, reserva y club.
- **Carta** y **menús** (incluidos menús para grupos y eventos).
- **Galería** del local y sección "Así se vive".
- **Il Club**: programa de fidelidad con tres niveles según los puntos acumulados, con descuentos y bonos de bienvenida y cumpleaños.
- **Tarjeta regalo**.
- **Información**: cómo llegar, llamada directa y horarios.
- **Franquicias** y **blog**, enlazados a la web del grupo.

## Tecnologías

- Flutter y Dart (Dart 3, `sdk: ^3.13.5`)
- Navegación por rutas con `MaterialApp`
- Enlaces externos para reservas, mapas y redes sociales

## Estructura

```
lib/
├── main.dart              # Rutas de la app
├── screens/               # Una pantalla por sección
├── widgets/               # Menú lateral, barra y componentes comunes
├── theme/app_theme.dart   # Colores y tipografías
└── utils/launch_helper.dart
assets/
├── images/
└── fonts/
```

## Cómo ejecutarlo

1. Instala [Flutter](https://docs.flutter.dev/get-started/install) (versión compatible con Dart 3.13).
2. Clona el repositorio y entra en la carpeta:
   ```bash
   git clone https://github.com/maikolcho/la-famiglia-app-.git
   cd la-famiglia-app-
   ```
3. Descarga las dependencias y ejecuta:
   ```bash
   flutter pub get
   flutter run
   ```
