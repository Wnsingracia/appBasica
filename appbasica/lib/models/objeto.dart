/// Clase que representa un objeto perdido o encontrado
/// Contiene información básica, ubicación y estado de si ha sido encontrado
class Objeto {
  /// Nombre del objeto (ej. "Llaves", "Mochila")
  final String nombre;

  /// Tipo de objeto (ej. "ropa", "accesorio", "electrónico")
  final String tipo;

  /// Descripción adicional del objeto
  final String descripcion;

  /// Lugar donde fue encontrado inicialmente (opcional)
  String lugarPerdido;

  /// Lugar donde se encuentra actualmente (opcional)
  String lugarActual;

  /// Indica si el objeto ha sido encontrado o no
  bool encontrado;

  /// Constructor principal
  /// Los campos obligatorios son [nombre], [tipo] y [descripcion]
  /// [lugarPerdido] y [lugarActual] son opcionales y se inicializan vacíos
  /// [encontrado] se inicializa como `false` por defecto
  Objeto({
    required this.nombre,
    required this.tipo,
    required this.descripcion,
    this.lugarPerdido = "",
    this.lugarActual = "",
    this.encontrado = false,
  });

  /// Sobrescribe el método toString para mostrar información legible del objeto
  /// Si no tiene lugares asignados, solo muestra nombre y tipo
  /// Si tiene lugares, muestra también lugar encontrado y lugar actual
  @override
  String toString() => lugarPerdido.isEmpty && lugarActual.isEmpty
      ? 'Objeto(nombre: $nombre, tipo: $tipo)'
      : 'Objeto(nombre: $nombre, tipo: $tipo, lugar encontrado: $lugarPerdido, lugar actual: $lugarActual)';
}
