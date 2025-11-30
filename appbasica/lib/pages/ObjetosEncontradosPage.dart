import 'package:appbasica/models/Objeto.dart';
import 'package:flutter/material.dart';

class ObjetosEncontradosPage extends StatefulWidget {
  const ObjetosEncontradosPage({super.key});

  @override
  State<ObjetosEncontradosPage> createState() => _ObjetosEncontradosPageState();
}

class _ObjetosEncontradosPageState extends State<ObjetosEncontradosPage> {
  final List<Objeto> objetos = [];
  // ObjetosEncontradosPage(this.objetos);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Objetos Encontrados")),
      body: objetos.isEmpty
          ? Center(child: Text("No hay objetos encontrados"))
          : ListView.builder(
              itemCount: objetos.length,
              itemBuilder: (context, index) {
                final objeto = objetos[index];
                return Card(
                  margin: EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(objeto.nombre),
                    subtitle: Text("Encontrado en: ${objeto.lugarEncontrado}"),
                  ),
                );
              },
            ),
    );
  }
  
}