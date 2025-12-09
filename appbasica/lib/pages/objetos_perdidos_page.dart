import 'package:appbasica/pages/agregar_objeto_page.dart'; // Página para añadir un objeto perdido
import 'package:appbasica/pages/registrar_objeto_encontrado_page.dart'; // Página para registrar que un objeto fue encontrado
import 'package:flutter/material.dart';
import 'package:appbasica/models/objeto.dart'; // Modelo del objeto
import 'package:appbasica/widgets/card_objeto_perdido.dart'; // Widget para mostrar cada objeto perdido
import 'package:appbasica/data/objeto_repository.dart'; // Repositorio que maneja la lista de objetos

/// Pantalla principal que muestra los objetos perdidos
/// La pantalla se actualiza automáticamente cuando cambian los objetos en el repositorio
class ObjetosPerdidosPage extends StatefulWidget {
  const ObjetosPerdidosPage({super.key});

  @override
  State<ObjetosPerdidosPage> createState() => _ObjetosPerdidosPageState();
}

class _ObjetosPerdidosPageState extends State<ObjetosPerdidosPage> {
  @override
  Widget build(BuildContext context) {
    // ValueListenableBuilder permite que la UI se actualice automáticamente
    // cuando cambia la lista de objetos en el repositorio
    return ValueListenableBuilder<List>(
      valueListenable: ObjetoRepository.instance.objects, // Lista escuchable de objetos
      builder: (context, list, _) {
        // Filtrar solo objetos que NO han sido encontrados
        final objetosPe
