import 'dart:ui';

import 'package:flutter/material.dart';

import '../helps/cores.dart';
import '../helps/titulos.dart';

class CardButton extends StatefulWidget {
  final IconData icone;
  final String titulo;
  final String subtitulo;

  CardButton({
    super.key,
    required this.icone,
    required this.titulo,
    required this.subtitulo,
  });

  @override
  State<CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedScale(
              scale: _isHovered ? 1.05 : 1.0,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: PaletaCor.branco.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: PaletaCor.branco.withOpacity(0.2),
                      ),
                      boxShadow: _isHovered
                          ? [
                              BoxShadow(
                                color: PaletaCor.verde_claro_amarelo
                                    .withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30), // espaço pro ícone
                        Text(widget.titulo, style: Estilos.verdeClaro25),
                        Text(widget.subtitulo, style: Estilos.branco12),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Ícone com animação junto
            AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              top: _isHovered ? -50 : -40,
              left: 35,
              child: AnimatedScale(
                scale: _isHovered ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOut,
                child: Container(
                  height: 80,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    widget.icone,
                    size: 60,
                    color: PaletaCor.verde_claro_amarelo,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
