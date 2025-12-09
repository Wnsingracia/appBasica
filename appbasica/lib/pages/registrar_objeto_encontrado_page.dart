import 'package:appbasica/models/objeto.dart';
import 'package:flutter/material.dart';
import 'package:appbasica/data/objeto_repository.dart';

class RegistrarObjetoEncontradoPage extends StatefulWidget {
  const RegistrarObjetoEncontradoPage({super.key, required this.objeto});
  final Objeto objeto;

  @override
  State<RegistrarObjetoEncontradoPage> createState() =>
      _RegistrarObjetoEncontradoPageState();
}

class _RegistrarObjetoEncontradoPageState
    extends State<RegistrarObjetoEncontradoPage> {
  final _formKey = GlobalKey<FormState>();
  final _lugarEncontradoController = TextEditingController();
  final _lugarActualController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrar Objeto encontrado")),
      backgroundColor: Color.fromARGB(255, 94, 88, 88),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Container(
              color: Color.fromARGB(255, 248, 248, 248),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      "Objeto: ${widget.objeto.nombre}",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: _lugarEncontradoController,
                      decoration: InputDecoration(
                        label: Text(
                          "Lugar encontrado",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Ingresa un lugar encontrado" : null,
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: _lugarActualController,
                      decoration: InputDecoration(
                        label: Text(
                          "Lugar actual",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Ingresa un lugar actual" : null,
                    ),
                    SizedBox(height: 100),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.only(
                          left: 40,
                          right: 40,
                          top: 15,
                          bottom: 15,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.objeto.lugarPerdido =
                              _lugarEncontradoController.text;
                          widget.objeto.lugarActual = _lugarActualController.text;
                          widget.objeto.encontrado = true;
                          ObjetoRepository.instance.update(widget.objeto);
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
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
