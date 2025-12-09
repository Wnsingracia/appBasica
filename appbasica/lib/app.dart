import 'package:appbasica/pages/objetos_encontrados_page.dart';
import 'package:appbasica/pages/objetos_perdidos_page.dart';
import 'package:appbasica/data/objeto_repository.dart';
import 'package:flutter/material.dart';

/// Pantalla principal de la app de objetos perdidos/encontrados.
/// Contiene:
/// - Navegación inferior (BottomNavigationBar) entre:
///    1. Objetos Perdidos
///    2. Objetos Encontrados
class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _index = 0; // Índice de la página actualmente seleccionada

  // Lista de páginas que se muestran según el índice
  final List<Widget> _pages = [ObjetosPerdidosPage(), ObjetosEncontradosPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mostrar la página según el índice actual
      body: _pages[_index],

      // Barra de navegación inferior
      bottomNavigationBar: ValueListenableBuilder<List>(
        // Escucha cambios en la lista de objetos del repositorio
        valueListenable: ObjetoRepository.instance.objects,
        builder: (context, objetos, _) {
          // Contar cuántos objetos están perdidos (no encontrados)
          final countPerdidos = objetos.where((o) => !o.encontrado).length;

          return BottomNavigationBar(
            currentIndex: _index, // Página activa
            onTap: (i) => setState(() => _index = i), // Cambiar de página al tocar
            items: [
              BottomNavigationBarItem(
                // Icono con "badge" mostrando la cantidad de objetos perdidos
                icon: Badge(
                  label: Text(countPerdidos.toString()),
                  child: const Icon(Icons.search),
                ),
                label: "Perdidos",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.check_circle),
                label: "Encontrados",
              ),
            ],
          );
        },
      ),
    );
  }
}
