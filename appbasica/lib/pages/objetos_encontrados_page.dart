import 'package:flutter/material.dart';
import 'package:appbasica/data/objeto_repository.dart';
import 'package:appbasica/widgets/card_objeto_encontrado.dart';

class ObjetosEncontradosPage extends StatefulWidget {
  const ObjetosEncontradosPage({super.key});

  @override
  State<ObjetosEncontradosPage> createState() => _ObjetosEncontradosPageState();
}

class _ObjetosEncontradosPageState extends State<ObjetosEncontradosPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List>(
      valueListenable: ObjetoRepository.instance.objects,
      builder: (context, list, _) {
        final encontrados = list.where((o) => o.encontrado).toList();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Objetos Encontrados'),
            centerTitle: true,
            backgroundColor: Colors.lightBlue.shade100,
          ),
          body: encontrados.isEmpty
              ? Center(child: Text('No hay objetos encontrados'))
              : ListView.builder(
                  itemCount: encontrados.length,
                  itemBuilder: (context, index) {
                    final objeto = encontrados[index];
                    return ObjetoEncontrado(
                      objeto: objeto,
                      onCheck: () {
                        setState(() {
                          objeto.encontrado = !objeto.encontrado;
                        });
                        ObjetoRepository.instance.update(objeto);
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
