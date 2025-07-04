import 'package:flutter/material.dart';

import '../componentes/botao_aredondado.dart';
import '../helps/cores.dart';
import '../helps/textos.dart';
import '../helps/titulos.dart';

class Apresentacao extends StatelessWidget {
  const Apresentacao({super.key});

  @override
  Widget build(BuildContext context) {
    var tela = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: tela.width * 0.1),
      child: Container(
        height: tela.height * 0.6,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // IMAGEM
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    'assets/imagens/cta-img-01-768x592.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Textos.apresentacao["titulo"]!,
                      style: Estilos.verdeClaro25,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      Textos.apresentacao["body"]!,
                      style: Estilos.subtitulo,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: BotaoAredondado(
                        acao: () {},
                        titulo: "Conheça agora mesmo!",
                        height: 40,
                        centralizado: true,
                        width: tela.width * 0.5,
                        Cor: PaletaCor.verde_claro_amarelo,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
