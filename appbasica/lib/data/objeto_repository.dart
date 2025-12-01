import 'package:flutter/foundation.dart';
import '../models/objeto.dart';

class ObjetoRepository {
  ObjetoRepository._internal();
  static final ObjetoRepository instance = ObjetoRepository._internal();

  // ValueNotifier para notificar cambios a las UI que escuchen
  final ValueNotifier<List<Objeto>> objects = ValueNotifier<List<Objeto>>([]);

  void add(Objeto objeto) {
    final list = List<Objeto>.from(objects.value);
    list.add(objeto);
    objects.value = list;
  }

  void update(Objeto objeto) {
    final list = List<Objeto>.from(objects.value);
    final idx = list.indexWhere((o) => identical(o, objeto) || o == objeto);
    if (idx != -1) {
      list[idx] = objeto;
      objects.value = list;
    }
  }

  List<Objeto> getAll() => List<Objeto>.from(objects.value);

  List<Objeto> getFound() => objects.value.where((o) => o.encontrado).toList();
}
