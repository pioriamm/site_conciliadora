import 'dart:math';

import 'package:flutter/material.dart';

import 'logo.dart';

class BackgroundFormas extends StatefulWidget {
  @override
  State<BackgroundFormas> createState() => _TelaAleatoriaState();
}

class _TelaAleatoriaState extends State<BackgroundFormas> {
  final Random random = Random();
  final int quantidade = 5;
  final double espacamentoMinimo = 100; // distância mínima entre os logos
  List<_LogoPosicao> logos = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final List<_LogoPosicao> novas = [];

      int tentativasMax = 1000;

      while (novas.length < quantidade && tentativasMax > 0) {
        final tamanho = random.nextDouble() * 100 + 50;
        final dx = random.nextDouble() * (size.width - tamanho);
        final dy = random.nextDouble() * (size.height - tamanho);
        final novaPos = Offset(dx, dy);

        bool sobrepoe = novas.any((existente) {
          final distancia = (existente.offset - novaPos).distance;
          return distancia < espacamentoMinimo;
        });

        if (!sobrepoe) {
          novas.add(_LogoPosicao(offset: novaPos, tamanho: tamanho));
        }

        tentativasMax--;
      }

      setState(() => logos = novas);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tamanhoTela = MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent,
      width: tamanhoTela.width,
      height: tamanhoTela.height,
      child: Stack(
        children: logos.map((logo) {
          return Positioned(
            left: logo.offset.dx,
            top: logo.offset.dy,
            child: LogoConciliadora(tamanho: logo.tamanho),
          );
        }).toList(),
      ),
    );
  }
}

class _LogoPosicao {
  final Offset offset;
  final double tamanho;

  _LogoPosicao({required this.offset, required this.tamanho});
}
