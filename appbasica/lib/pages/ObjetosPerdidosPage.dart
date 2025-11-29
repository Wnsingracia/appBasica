import 'package:appbasica/pages/AgregarObjetoPage.dart';
import 'package:appbasica/pages/RegistrarObjetoEncontradoPage.dart';
import 'package:flutter/material.dart';
import 'package:appbasica/models/Objeto.dart';
import 'package:appbasica/widgets/CardObjectoPerdido.dart';

class ObjetosPerdidosPage extends StatefulWidget {
  const ObjetosPerdidosPage({super.key});

  @override
  State<ObjetosPerdidosPage> createState() => _ObjetosPerdidosPageState();
}

class _ObjetosPerdidosPageState extends State<ObjetosPerdidosPage> {
  List<Objeto> objetos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Objetos Perdidos'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade100,
      ),

      body: ListView.builder(
        itemCount: objetos.length,
        itemBuilder: (context, index) {
          return ObjetoPerdido(
            objeto: objetos[index],
            onCheck: () => _check(objetos[index]),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Text("aniadir"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AgregarObjetoPage(
                onSave: (nuevoObjeto) {
                  setState(() {
                    objetos.add(nuevoObjeto);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }

  _check(Objeto objeto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RegistrarObjetoEncontradoPage(
          objeto: objeto,
        ),
      ),
    );
    setState(() {
      objeto.encontrado = !objeto.encontrado;
    });
  }
}
