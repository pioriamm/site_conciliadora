import 'dart:ui';

import 'package:flutter/material.dart';

import '../helps/cores.dart';
import '../helps/titulos.dart';

class CardPreco extends StatefulWidget {
  late final double valor;
  List<Widget> opcoesPlano;
  String nome;

  CardPreco({
    super.key,
    required this.valor,
    required this.opcoesPlano,
    required this.nome,
  });

  @override
  State<CardPreco> createState() => _CardPrecoState();
}

class _CardPrecoState extends State<CardPreco> {
  bool _isHovered = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 310,
              height: 420,
              decoration: BoxDecoration(
                color: PaletaCor.branco.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: PaletaCor.branco.withOpacity(0.2)),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: PaletaCor.verde_escuro,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        height: 30,
                        width: double.infinity,

                        child: Center(
                          child: Text(widget.nome, style: Estilos.titulo),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            widget.valor == 0
                                ? Text("Consultar", style: Estilos.enfase)
                                : Text(
                                    "RS ${widget.valor.toStringAsFixed(2)}",
                                    style: Estilos.enfase,
                                  ),
                            Text(
                              '/mês por CNPJ',
                              style: Estilos.branco12negrito,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Adesão de R\$ 399,00 por CNPJ',
                          style: Estilos.verdeClaro20,
                        ),
                      ),
                      Text('Inclui:', style: Estilos.branco12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.opcoesPlano,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
