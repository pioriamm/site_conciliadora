import 'package:flutter/material.dart';

import '../helps/cores.dart';

class BackgroundSite extends StatelessWidget {
  var tela;
  BackgroundSite({required this.tela});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                PaletaCor.verde_escuro.withValues(alpha: 1),
                PaletaCor.verde_claro.withValues(alpha: 0.9),
                PaletaCor.verde_claro_amarelo.withValues(alpha: 0.7),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          width: tela.width,
          height: tela.height * 6,
        ),
      ],
    );
  }
}
