import 'package:flutter/material.dart';

import '../helps/cores.dart';
import '../helps/titulos.dart';

class BotaoAredondado extends StatelessWidget {
  String titulo;
  VoidCallback acao;
  var Cor;
  var height;
  var width;
  bool centralizado;

  BotaoAredondado({
    super.key,
    required this.acao,
    required this.titulo,
    this.Cor,
    this.height,
    this.width,
    this.centralizado = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: acao,
      child: Container(
        padding: EdgeInsets.all(5),
        height: height ?? 30,
        width: width ?? 100,
        decoration: BoxDecoration(
          color: Cor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: BoxBorder.all(color: PaletaCor.branco, width: 0.5),
        ),
        child: centralizado
            ? Center(child: Text(titulo, style: Estilos.branco12negrito))
            : Text(titulo, style: Estilos.branco12negrito),
      ),
    );
  }
}
