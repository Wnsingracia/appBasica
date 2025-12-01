import 'package:appbasica/models/objeto.dart';
import 'package:flutter/material.dart';

class ObjetoPerdido extends StatelessWidget {
  final Objeto objeto;
  final Function() onCheck;

  const ObjetoPerdido({super.key, required this.objeto, required this.onCheck});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink.shade50,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(value: objeto.encontrado, onChanged: (__) => onCheck()),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    objeto.nombre,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(objeto.descripcion, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
