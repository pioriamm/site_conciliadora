import 'package:flutter/material.dart';

import '../helps/titulos.dart';

class BotaoHover extends StatefulWidget {
  final VoidCallback acao;
  final posicaoScroll;
  final String texto;

  const BotaoHover({
    super.key,
    required this.acao,
    required this.texto,
    required this.posicaoScroll,
  });

  @override
  State<BotaoHover> createState() => _BotaoHoverState();
}

class _BotaoHoverState extends State<BotaoHover> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    var tela = MediaQuery.of(context).size;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: TextButton(
        onPressed: widget.acao, // já trata clique
        child: Text(
          widget.texto,
          style: _isHovering
              ? widget.posicaoScroll > tela.height * 0.50
                    ? Estilos.verdeEscuro12
                    : Estilos.verdeClaro12
              : Estilos.branco12negrito,
        ),
      ),
    );
  }
}
