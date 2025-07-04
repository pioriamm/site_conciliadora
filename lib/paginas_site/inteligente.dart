import 'dart:ui';

import 'package:flutter/material.dart';

import '../helps/cores.dart';
import '../helps/textos.dart';
import '../helps/titulos.dart';

class Inteligente extends StatelessWidget {
  const Inteligente({super.key});

  @override
  Widget build(BuildContext context) {
    var tela = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: tela.width * 0.1),
      child: Container(
        height: tela.height * 0.6,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: PaletaCor.verde_escuro.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/imagens/icon-04.png',
                              fit: BoxFit.contain,
                              height: 40,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              Textos.Inteligente["titulo"]!,
                              style: Estilos.verdeClaro40,
                            ),
                          ],
                        ),
                        const SizedBox(height: 100),
                        Text(
                          Textos.Inteligente["subtitulo"]!,
                          style: Estilos.verdeClaro12,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          Textos.Inteligente["body"]!,
                          style: Estilos.subtitulo,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/imagens/inteligente.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 120),
          ],
        ),
      ),
    );
  }
}
