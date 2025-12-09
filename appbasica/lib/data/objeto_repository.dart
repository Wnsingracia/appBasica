import 'package:flutter/foundation.dart';
import '../models/objeto.dart';

/// Repositorio singleton para manejar la lista de objetos de la app
/// Contiene tanto objetos perdidos como encontrados.
/// Permite notificar cambios a la UI mediante [ValueNotifier].
class ObjetoRepository {
  // Constructor privado para implementar el patrón singleton
  ObjetoRepository._internal();

  // Instancia única del repositorio
  static final ObjetoRepository instance = ObjetoRepository._internal();

  /// [ValueNotifier] que mantiene la lista de objetos y notifica cambios
  /// Cada vez que se modifica la lista, los widgets que escuchan se actualizan.
  final ValueNotifier<List<Objeto>> objects = ValueNotifier<List<Objeto>>([]);

  /// Agrega un nuevo objeto a la lista
  /// Copia la lista actual, añade el objeto, y actualiza el ValueNotifier
  void add(Objeto objeto) {
    final list = List<Objeto>.from(objects.value);
    list.add(objeto);
    objects.value = list; // Notifica a la UI los cambios
  }

  /// Actualiza un objeto existente en la lista
  /// Busca el objeto por identidad o igualdad, lo reemplaza y notifica cambios
  void update(Objeto objeto) {
    final list = List<Objeto>.from(objects.value);
    final idx = list.indexWhere((o) => identical(o, objeto) || o == objeto);
    if (idx != -1) {
      list[idx] = objeto;
      objects.value = list; // Notifica a la UI los cambios
    }
  }

  /// Obtiene una copia de todos los objetos
  List<Objeto> getAll() => List<Objeto>.from(objects.value);

  /// Obtiene solo los objetos que han sido marcados como encontrados
  List<Objeto> getFound() => objects.value.where((o) => o.encontrado).toList();
}
