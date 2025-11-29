class Objeto {
  final String nombre;
  final String tipo;
  final String descripcion;
  String lugarPerdido;
  String lugarActual;
  bool encontrado;

  Objeto({
    required this.nombre,
    required this.tipo,
    required this.descripcion,
    this.lugarPerdido = "",
    this.lugarActual = "",
    this.encontrado = false,
  });
}
