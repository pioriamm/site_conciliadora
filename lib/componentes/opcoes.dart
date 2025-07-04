import 'package:flutter/material.dart';

import '../helps/cores.dart';
import '../helps/titulos.dart';

class Opcoes extends StatelessWidget {
  String titulo;

  Opcoes({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: PaletaCor.verde_claro_amarelo,
            size: 12,
          ),
          SizedBox(width: 10),
          Text(titulo, style: Estilos.branco12),
        ],
      ),
    );
  }
}
