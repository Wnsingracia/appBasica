import 'package:appbasica/models/objeto.dart';
import 'package:flutter/material.dart';
import 'package:appbasica/data/objeto_repository.dart';

/// Pantalla para registrar información de un objeto que ha sido encontrado
/// Permite al usuario ingresar:
/// - Lugar donde se encontró el objeto
/// - Lugar actual donde se encuentra
/// Al guardar, se actualiza el objeto en el repositorio y se marca como encontrado
class RegistrarObjetoEncontradoPage extends StatefulWidget {
  const RegistrarObjetoEncontradoPage({super.key, required this.objeto});

  final Objeto objeto; // El objeto que se está registrando

  @override
  State<RegistrarObjetoEncontradoPage> createState() =>
      _RegistrarObjetoEncontradoPageState();
}

class _RegistrarObjetoEncontradoPageState
    extends State<RegistrarObjetoEncontradoPage> {
  final _formKey = GlobalKey<FormState>(); // Llave para validar el formulario
  final _lugarEncontradoController = TextEditingController(); // Controlador del campo "lugar encontrado"
  final _lugarActualController = TextEditingController(); // Controlador del campo "lugar actual"

  @override
  void dispose() {
    // Liberar memoria de los controladores cuando la pantalla se destruye
    _lugarEncontradoController.dispose();
    _lugarActualController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrar Objeto encontrado")),
      backgroundColor: const Color.fromARGB(255, 94, 88, 88),

      // Permite hacer scroll si el teclado cubre los campos
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          // Formulario para validar campos obligatorios
          child: Form(
            key: _formKey,
            child: Container(
              color: const Color.fromARGB(255, 248, 248, 248),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Mostrar nombre del objeto
                    Text(
                      "Objeto: ${widget.objeto.nombre}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const SizedBox(height: 40),

                    // Campo para ingresar el lugar donde se encontró el objeto
                    TextFormField(
                      controller: _lugarEncontradoController,
                      decoration: const InputDecoration(
                        label: Text(
                          "Lugar encontrado",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Ingresa un lugar encontrado" : null,
                    ),
                    const SizedBox(height: 40),

                    // Campo para ingresar el lugar actual del objeto
                    TextFormField(
                      controller: _lugarActualController,
                      decoration: const InputDecoration(
                        label: Text(
                          "Lugar actual",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Ingresa un lugar actual" : null,
                    ),
                    const SizedBox(height: 100),

                    // Botón para guardar cambios
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                          top: 15,
                          bottom: 15,
                        ),
                      ),
                      onPressed: () {
                        // Validar que los campos no estén vacíos
                        if (_formKey.currentState!.validate()) {
                          // Guardar la información en el objeto
                          widget.objeto.lugarPerdido =
                              _lugarEncontradoController.text;
                          widget.objeto.lugarActual =
                              _lugarActualController.text;

                          // Marcar objeto como encontrado
                          widget.objeto.encontrado = true;

                          // Actualizar el objeto en el repositorio
                          ObjetoRepository.instance.update(widget.objeto);

                          // Cerrar la pantalla y regresar a la lista de objetos
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        "Guardar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
