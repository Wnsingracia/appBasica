import 'package:appbasica/models/objeto.dart';
import 'package:flutter/material.dart';

/// Pantalla para agregar un objeto perdido
/// Esta página recibe un callback [onSave] para enviar el objeto creado
/// de vuelta a la pantalla anterior.
/// Se compone de un formulario con tres campos:
/// - Nombre del objeto (obligatorio)
/// - Descripción (opcional)
/// - Tipo de objeto (opcional, ejemplo: ropa, accesorio)
class AgregarObjetoPage extends StatefulWidget {
  final Function(Objeto) onSave; // Función que recibe el objeto creado

  const AgregarObjetoPage({super.key, required this.onSave});

  @override
  State<AgregarObjetoPage> createState() => _AgregarObjetoPageState();
}

class _AgregarObjetoPageState extends State<AgregarObjetoPage> {
  // --- Controladores de texto ---
  // Permiten leer y modificar el contenido de cada campo de texto
  final _formKey = GlobalKey<FormState>(); // Para validar el formulario
  final _nombreController = TextEditingController(); 
  final _descripcionController = TextEditingController();
  final _tipoController = TextEditingController();

  @override
  void dispose() {
    // Limpiar los controladores cuando la pantalla se cierre para liberar memoria
    _nombreController.dispose();
    _descripcionController.dispose();
    _tipoController.dispose();
    super.dispose();
  }

  /// Función que crea un nuevo objeto y lo devuelve a la pantalla anterior
  /// - Solo guarda si el formulario es válido
  /// - Llama al callback [widget.onSave] pasando el objeto creado
  /// - Cierra esta pantalla usando [Navigator.pop]
  void _guardarObjeto() {
    if (_formKey.currentState!.validate()) {
      final nuevoObjeto = Objeto(
        nombre: _nombreController.text, // Nombre ingresado por el usuario
        descripcion: _descripcionController.text, // Descripción ingresada
        tipo: _tipoController.text, // Tipo ingresado
      );

      // Devuelve el objeto a la pantalla anterior
      widget.onSave(nuevoObjeto);

      // Cierra la pantalla actual
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar ---
      appBar: AppBar(
        title: const Text("Añadir objeto perdido"),
        backgroundColor: Colors.lightBlue.shade100,
        centerTitle: true,
      ),

      // --- Color de fondo ---
      backgroundColor: const Color.fromARGB(255, 94, 88, 88),

      // --- Cuerpo principal con scroll ---
      body: SingleChildScrollView(
        // Permite que la pantalla sea scrollable si el teclado cubre los campos
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey, // Asociamos el formulario a la validación
            child: Column(
              children: [
                // --- Contenedor principal del formulario ---
                Container(
                  color: const Color.fromARGB(255, 248, 248, 248),
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        // Título de la sección
                        const Text(
                          "Objeto Perdido",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // --- Formulario con campos ---
                        Container(
                          color: const Color.fromARGB(255, 222, 222, 222),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),

                                // --- Campo: Nombre del objeto (obligatorio) ---
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(243, 236, 255, 0.573),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    controller: _nombreController,
                                    decoration: const InputDecoration(
                                      label: Text(
                                        "Objeto Perdido",
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                    validator: (value) => value!.isEmpty
                                        ? "Ingresa un objeto" // Mensaje si el campo está vacío
                                        : null,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // --- Campo: Descripción (opcional) ---
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(243, 236, 255, 0.573),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    controller: _descripcionController,
                                    decoration: const InputDecoration(
                                      label: Text(
                                        "Descripción",
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // --- Campo: Tipo (opcional) ---
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(243, 236, 255, 0.573),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    controller: _tipoController,
                                    decoration: const InputDecoration(
                                      label: Text(
                                        "Tipo (ropa, accesorio...)",
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 200), // Espacio extra al final del formulario
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // --- Botón para guardar el objeto ---
                SizedBox(
                  width: double.infinity, // Botón ocupa todo el ancho
                  child: ElevatedButton(
                    onPressed: _guardarObjeto, // Llama a la función de guardado
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      "Añadir Objeto",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
