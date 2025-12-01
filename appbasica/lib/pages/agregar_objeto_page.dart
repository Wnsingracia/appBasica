import 'package:appbasica/models/objeto.dart';
import 'package:flutter/material.dart';

class AgregarObjetoPage extends StatefulWidget {
  final Function(Objeto) onSave;
  const AgregarObjetoPage({super.key, required this.onSave});

  @override
  State<AgregarObjetoPage> createState() => _AgregarObjetoPageState();
}

class _AgregarObjetoPageState extends State<AgregarObjetoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _tipoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _tipoController.dispose();
    super.dispose();
  }

  void _guardarObjeto() {
    if (_formKey.currentState!.validate()) {
      final nuevoObjeto = Objeto(
        nombre: _nombreController.text,
        descripcion: _descripcionController.text,
        tipo: _tipoController.text,
      );

      widget.onSave(nuevoObjeto);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Añadir objeto perdido"),
        backgroundColor: Colors.lightBlue.shade100,
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 94, 88, 88),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 248, 248, 248),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          "Objeto Perdido",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          color: Color.fromARGB(255, 222, 222, 222),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                      243,
                                      236,
                                      255,
                                      0.573,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    controller: _nombreController,
                                    decoration: InputDecoration(
                                      label: Text(
                                        "Objeto Perdido",
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                    ),
                                    validator: (value) => value!.isEmpty
                                        ? "Ingresa un objeto"
                                        : null,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                      243,
                                      236,
                                      255,
                                      0.573,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    controller: _descripcionController,
                                    decoration: InputDecoration(
                                      label: Text(
                                        "Descripción",
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                      243,
                                      236,
                                      255,
                                      0.573,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    controller: _tipoController,
                                    decoration: InputDecoration(
                                      label: Text(
                                        "Tipo (ropa, accesorio...)",
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      border: OutlineInputBorder(),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _guardarObjeto,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
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
