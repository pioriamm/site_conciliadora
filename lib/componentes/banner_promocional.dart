import 'dart:ui';

import 'package:flutter/material.dart';

import '../helps/cores.dart';
import '../helps/titulos.dart';

class BannerPromocional extends StatelessWidget {
  const BannerPromocional({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150.0, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: PaletaCor.verde_claro_amarelo.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: PaletaCor.verde_claro_amarelo.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "PLANO ANUAL COM 20% OFF NAS MENSALIDADES + DESCONTO NA ADESÃO",
                      style: Estilos.subtitulo,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
