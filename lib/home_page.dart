import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:site_conciliadora/paginas_site/apresentacao.dart';
import 'package:site_conciliadora/paginas_site/descomplica.dart';
import 'package:site_conciliadora/paginas_site/formulario_whatsapp.dart';
import 'package:site_conciliadora/paginas_site/inteligente.dart';
import 'package:site_conciliadora/paginas_site/moderno.dart';
import 'package:site_conciliadora/paginas_site/paginas_planos.dart';
import 'package:site_conciliadora/paginas_site/parceira.dart';

import 'componentes/background_formas.dart';
import 'componentes/background_site.dart';
import 'componentes/botao_aredondado.dart';
import 'componentes/botao_texto.dart';
import 'componentes/cabecalho_animado.dart';
import 'componentes/logo.dart';
import 'helps/cores.dart';
import 'helps/titulos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tela = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          BackgroundSite(tela: tela),
          BackgroundFormas(),
          SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: tela.width >= 1085
                  ? EdgeInsets.symmetric(horizontal: 250)
                  : EdgeInsets.all(0),
              child: Column(
                children: [
                  SizedBox(height: tela.height * 0.12),
                  Apresentacao(),
                  SizedBox(height: tela.height * 0.12),
                  Moderno(),
                  SizedBox(height: tela.height * 0.12),
                  Parceria(),
                  SizedBox(height: tela.height * 0.12),
                  Descomplica(),
                  SizedBox(height: tela.height * 0.12),
                  Inteligente(),
                  SizedBox(height: tela.height * 0.12),
                  PaginasPlanos(),
                ],
              ),
            ),
          ),
          Positioned(
            top: _scrollOffset == 0 ? 5 : 20,
            child: CabecalhoAnimado(
              opcoesMenu: [
                LogoConciliadora(tamanho: 25, eBranco: true),
                BotaoHover(
                  acao: () {},
                  posicaoScroll: _scrollOffset,
                  texto: "+Concliação",
                ),
                BotaoHover(
                  acao: () {},
                  posicaoScroll: _scrollOffset,
                  texto: "Parceiro",
                ),
                BotaoHover(
                  acao: () {},
                  posicaoScroll: _scrollOffset,
                  texto: "Planos",
                ),
                BotaoHover(
                  acao: () {},
                  posicaoScroll: _scrollOffset,
                  texto: "Universidade",
                ),
                BotaoHover(
                  acao: () {},
                  posicaoScroll: _scrollOffset,
                  texto: "Quem somos",
                ),
                BotaoHover(
                  acao: () {},
                  posicaoScroll: _scrollOffset,
                  texto: "Blog",
                ),
                BotaoHover(
                  acao: () {},
                  posicaoScroll: _scrollOffset,
                  texto: "Contato",
                ),
                BotaoAredondado(acao: () {}, titulo: "Área do Cliente"),
              ],
              scrollOffset: _scrollOffset,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => const FormularioWhatsApp(),
        ),
        backgroundColor: Colors.green,
        icon: const FaIcon(FontAwesomeIcons.whatsapp, color: PaletaCor.branco),
        label: Text('WhatsApp', style: Estilos.branco12negrito),
        tooltip: 'Abrir WhatsApp',
      ),
    );
  }
}
