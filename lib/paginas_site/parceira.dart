import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../componentes/card_button.dart';
import '../helps/cores.dart';
import '../helps/textos.dart';
import '../helps/titulos.dart';

class Parceria extends StatelessWidget {
  const Parceria({super.key});

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
                              'assets/imagens/icon-02.png',
                              fit: BoxFit.contain,
                              height: 40,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              Textos.Parceria["titulo"]!,
                              style: Estilos.verdeClaro40,
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        Text(
                          Textos.Parceria["subtitulo"]!,
                          style: Estilos.verdeClaro12,
                        ),
                        const SizedBox(height: 50),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Row(
                            children: [
                              CardButton(
                                icone: FontAwesomeIcons.star,
                                titulo: '10.000',
                                subtitulo: 'Clientes Ativos',
                              ),
                              CardButton(
                                icone: FontAwesomeIcons.squareCheck,
                                titulo: '+100',
                                subtitulo: 'Meios de Pagamento',
                              ),
                              CardButton(
                                icone: FontAwesomeIcons.handshake,
                                titulo: '+200',
                                subtitulo: 'Parceiros',
                              ),
                              CardButton(
                                icone: FontAwesomeIcons.comment,
                                titulo: '',
                                subtitulo:
                                    'Atendimento em todo\n território nacional',
                              ),
                              CardButton(
                                icone: FontAwesomeIcons.magnifyingGlassChart,
                                titulo: 'R\$ 5',
                                subtitulo:
                                    'Bilhões de vendas\nprocessadas\nensalmente',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Text(
                          Textos.Parceria["body"]!,
                          style: Estilos.subtitulo,
                        ),
                      ],
                    ),
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
