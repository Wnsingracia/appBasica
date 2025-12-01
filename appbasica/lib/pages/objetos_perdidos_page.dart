import 'package:appbasica/pages/agregar_objeto_page.dart';
import 'package:appbasica/pages/registrar_objeto_encontrado_page.dart';
import 'package:flutter/material.dart';
import 'package:appbasica/models/objeto.dart';
import 'package:appbasica/widgets/card_objeto_perdido.dart';
import 'package:appbasica/data/objeto_repository.dart';

class ObjetosPerdidosPage extends StatefulWidget {
  const ObjetosPerdidosPage({super.key});

  @override
  State<ObjetosPerdidosPage> createState() => _ObjetosPerdidosPageState();
}

class _ObjetosPerdidosPageState extends State<ObjetosPerdidosPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List>(
      valueListenable: ObjetoRepository.instance.objects,
      builder: (context, list, _) {
        // Filtrar solo objetos NO encontrados
        final objetosPerdidos = list.where((o) => !o.encontrado).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Objetos Perdidos'),
            centerTitle: true,
            backgroundColor: Colors.lightBlue.shade100,
          ),
          body: objetosPerdidos.isEmpty
              ? Center(
                  child: Text(
                    'No hay objetos perdidos',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                )
              : ListView.builder(
                  itemCount: objetosPerdidos.length,
                  itemBuilder: (context, index) {
                    return ObjetoPerdido(
                      objeto: objetosPerdidos[index],
                      onCheck: () => _check(objetosPerdidos[index]),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.add),
            label: Text("Añadir"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AgregarObjetoPage(
                    onSave: (nuevoObjeto) {
                      ObjetoRepository.instance.add(nuevoObjeto);
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  _check(Objeto objeto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RegistrarObjetoEncontradoPage(objeto: objeto),
      ),
    );
    objeto.encontrado = !objeto.encontrado;
    ObjetoRepository.instance.update(objeto);
  }
}
