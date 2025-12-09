import 'package:appbasica/pages/objetos_encontrados_page.dart';
import 'package:appbasica/pages/objetos_perdidos_page.dart';
import 'package:appbasica/data/objeto_repository.dart';
import 'package:flutter/material.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _index = 0;
  final List<Widget> _pages = [ObjetosPerdidosPage(), ObjetosEncontradosPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: ValueListenableBuilder<List>(
        valueListenable: ObjetoRepository.instance.objects,
        builder: (context, objetos, _) {
          final countPerdidos = objetos.where((o) => !o.encontrado).length;
          return BottomNavigationBar(
            // funcionamiento de navegacion 
            currentIndex: _index,
            onTap: (i) => setState(() => _index = i),
            items: [
              BottomNavigationBarItem(
                icon: Badge(
                  label: Text(countPerdidos.toString()),
                  child: Icon(Icons.search),
                ),
                label: "Perdidos",
              ),
              BottomNavigationBarItem(
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
