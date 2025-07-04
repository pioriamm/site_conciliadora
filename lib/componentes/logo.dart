import 'package:flutter/material.dart';

import '../helps/cores.dart';

class LogoConciliadora extends StatelessWidget {
  final double tamanho;
  final bool eBranco;

  LogoConciliadora({super.key, required this.tamanho, this.eBranco = false});

  @override
  Widget build(BuildContext context) {
    final alfa = 0.5;
    final corVerdeEscuro = eBranco
        ? PaletaCor.branco
        : PaletaCor.verde_escuro.withValues(alpha: alfa);
    final corAmareloLimao = eBranco
        ? PaletaCor.branco
        : PaletaCor.verde_claro_amarelo.withValues(alpha: alfa);

    final larguraBarra = tamanho * 0.6;
    final alturaBarra = tamanho * 0.2;
    final tamanhoBolinha = tamanho * 0.2;
    final espaco = tamanho * 0.15;

    return SizedBox(
      width: tamanho,
      height: tamanho,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: _bolinha(corVerdeEscuro, tamanhoBolinha)),
              SizedBox(width: espaco),
              Flexible(
                child: _barra(
                  corVerdeEscuro,
                  largura: larguraBarra,
                  altura: alturaBarra,
                ),
              ),
            ],
          ),
          SizedBox(height: espaco),
          _barra(corAmareloLimao, largura: tamanho, altura: alturaBarra),
          SizedBox(height: espaco),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: _barra(
                  corVerdeEscuro,
                  largura: larguraBarra,
                  altura: alturaBarra,
                ),
              ),
              SizedBox(width: espaco),
              Flexible(child: _bolinha(corVerdeEscuro, tamanhoBolinha)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bolinha(Color cor, double tamanho) {
    return Container(
      width: tamanho,
      height: tamanho,
      decoration: BoxDecoration(color: cor, shape: BoxShape.circle),
    );
  }

  Widget _barra(Color cor, {required double largura, required double altura}) {
    return Container(
      width: largura,
      height: altura,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(altura / 2),
      ),
    );
  }
}
