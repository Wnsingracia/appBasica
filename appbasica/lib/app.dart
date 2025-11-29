import 'package:appbasica/pages/ObjetosEncontradosPage.dart';
import 'package:appbasica/pages/ObjetosPerdidosPage.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Perdidos"),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: "Encontrados",
          ),
        ],
      ),
    );
  }
}
