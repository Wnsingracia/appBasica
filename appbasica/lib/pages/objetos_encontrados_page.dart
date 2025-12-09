import 'package:flutter/material.dart';
import 'package:appbasica/data/objeto_repository.dart'; // Repositorio que maneja los objetos
import 'package:appbasica/widgets/card_objeto_encontrado.dart'; // Widget personalizado para mostrar cada objeto

/// Página que muestra la lista de objetos encontrados
/// Esta pantalla escucha los cambios en el repositorio de objetos
/// y se actualiza automáticamente cuando hay cambios.
class ObjetosEncontradosPage extends StatefulWidget {
  const ObjetosEncontradosPage({super.key});

  @override
  State<ObjetosEncontradosPage> createState() => _ObjetosEncontradosPageState();
}

class _ObjetosEncontradosPageState extends State<ObjetosEncontradosPage> {
  @override
  Widget build(BuildContext context) {
    // ValueListenableBuilder permite reaccionar automáticamente
    // a cambios en la lista de objetos del repositorio
    return ValueListenableBuilder<List>(
      valueListenable: ObjetoRepository.instance.objects, // Lista de objetos escuchable
      builder: (context, list, _) {
        // Filtramos solo los objetos que están marcados como "encontrados"
        final encontrados = list.where((o) => o.encontrado).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Objetos Encontrados'),
            centerTitle: true,
            backgroundColor: Colors.lightBlue.shade100,
          ),
          
          // Si no hay objetos encontrados, mostramos un mensaje central
          body: encontrados.isEmpty
              ? const Center(
                  child: Text(
                    'No hay objetos encontrados',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              // Si hay objetos encontrados, los mostramos en una lista
              : ListView.builder(
                  itemCount: encontrados.length, // Número de objetos encontrados
                  itemBuilder: (context, index) {
                    final objeto = encontrados[index]; // Objeto actual

                    // ObjetoEncontrado es un widget personalizado que muestra
                    // la información del objeto y un checkbox para marcarlo
                    return ObjetoEncontrado(
                      objeto: objeto,
                      onCheck: () {
                        // Cambiamos el estado de "encontrado" del objeto
                        setState(() {
                          objeto.encontrado = !objeto.encontrado;
                        });

                        // Actualizamos el repositorio para persistir el cambio
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
