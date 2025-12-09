import 'package:appbasica/app.dart'; // Importa la pantalla principal de la app
import 'package:flutter/material.dart';

/// Punto de entrada de la app
void main() {
  runApp(const MainApp()); // Ejecuta la aplicación
}

/// Widget principal de la app
/// Contiene un [MaterialApp] que es el contenedor principal de Flutter
/// y carga la [PantallaPrincipal] dentro de un Scaffold.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // [home] define la primera pantalla que se mostrará al abrir la app
      home: Scaffold(
        body: PantallaPrincipal(), // Carga la pantalla principal de la app
      ),
    );
  }
}
