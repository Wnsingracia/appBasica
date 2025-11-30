import 'package:appbasica/models/Objeto.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Objeto: ${widget.objeto.nombre}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _lugarEncontradoController,
                decoration: InputDecoration(labelText: "Lugar encontrado"),
              ),
              TextFormField(
                controller: _lugarActualController,
                decoration: InputDecoration(labelText: "Lugar actual"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  widget.objeto.lugarEncontrado = _lugarEncontradoController.text;
                  widget.objeto.lugarActual = _lugarEncontradoController.text;
                  widget.objeto.encontrado = true;
                  Navigator.pop(context, true);
                },
                child: Text("Guardar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
