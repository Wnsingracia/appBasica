class Objeto {
  final String nombre;
  final String tipo;
  final String descripcion;
  String lugarEncontrado;
  String lugarActual;
  bool encontrado;

  Objeto({
    required this.nombre,
    required this.tipo,
    required this.descripcion,
    this.lugarEncontrado = "",
    this.lugarActual = "",
    this.encontrado = false,
  });
}
