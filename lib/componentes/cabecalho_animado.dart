import 'dart:ui';

import 'package:flutter/material.dart';

import '../helps/cores.dart';

class CabecalhoAnimado extends StatefulWidget {
  final List<Widget> opcoesMenu;
  double scrollOffset = 0;

  CabecalhoAnimado({
    super.key,
    required this.opcoesMenu,
    required this.scrollOffset,
  });

  @override
  State<CabecalhoAnimado> createState() => _CabecalhoAnimadoState();
}

class _CabecalhoAnimadoState extends State<CabecalhoAnimado> {
  @override
  Widget build(BuildContext context) {
    final tela = MediaQuery.of(context).size;
    const larguraMinima = 0.8;
    const scrollMax = 300.0;
    final progress = (widget.scrollOffset / scrollMax).clamp(0.0, 1.0);
    final larguraAtual = tela.width * (1 - (1 - larguraMinima) * progress);

    return ClipRRect(
      borderRadius: widget.scrollOffset == 0
          ? BorderRadius.circular(0)
          : BorderRadius.circular(50), // borda arredondada
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // efeito fosco
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: PaletaCor.verde_escuro.withValues(alpha: 0.2),
            borderRadius: widget.scrollOffset == 0
                ? BorderRadius.circular(0)
                : BorderRadius.circular(50),
            border: Border.all(
              color: widget.scrollOffset == larguraAtual
                  ? PaletaCor.verde_escuro.withValues(alpha: 0.2)
                  : PaletaCor.verde_escuro.withValues(alpha: 0.2),
            ),
          ),
          width: larguraAtual.clamp(tela.width * larguraMinima, tela.width),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.opcoesMenu,
            ),
          ),
        ),
      ),
    );
  }
}
