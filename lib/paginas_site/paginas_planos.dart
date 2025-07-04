import 'package:flutter/material.dart';

import '../componentes/banner_promocional.dart';
import '../componentes/card_preco.dart';
import '../componentes/opcoes.dart';
import '../helps/textos.dart';
import '../helps/titulos.dart';

class PaginasPlanos extends StatelessWidget {
  const PaginasPlanos({super.key});

  @override
  Widget build(BuildContext context) {
    var tela = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: tela.width * 0.1),
      child: Container(
        height: tela.height * 1.5,
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Textos.planos["titulo"]!, style: Estilos.verdeClaro40),
            const SizedBox(height: 10),
            Text(Textos.planos["subtitulo"]!, style: Estilos.subtitulo),
            const SizedBox(height: 40),
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  CardPreco(
                    valor: 199.00,
                    nome: "Plano Básico",
                    opcoesPlano: [
                      Opcoes(
                        titulo:
                            "Acesso a todas as funcionalidades \ndo sistema",
                      ),
                      Opcoes(titulo: "Todas as adquirentes suportadas"),
                      Opcoes(titulo: "Suporte via chamados"),
                      Opcoes(titulo: "Implantação inclusa"),
                      Opcoes(titulo: "Até 10.000 vendas mês"),
                      Opcoes(titulo: "Webnar Disponivel"),
                    ],
                  ),
                  CardPreco(
                    valor: 249.00,
                    nome: "Plano Completo",
                    opcoesPlano: [
                      Opcoes(
                        titulo: "Todas as funcionalidades do plano anterior",
                      ),
                      Opcoes(
                        titulo:
                            "+ Integração com seu Sistema de Gestão \nvia API",
                      ),
                      Opcoes(
                        titulo:
                            "+ Integração com o extrato de sua conta \nbancária via CNAB240",
                      ),
                      Opcoes(titulo: "+ Suporte via Chat"),
                      Opcoes(titulo: "Até 25.000 vendas mês"),
                      Opcoes(titulo: "Webnar Disponivel"),
                    ],
                  ),
                  CardPreco(
                    valor: 0,
                    nome: "Plano Master",
                    opcoesPlano: [
                      Opcoes(
                        titulo: "Desenvolvimento de projetos customizados",
                      ),
                      Opcoes(
                        titulo:
                            "Analista de requisitos e desenvolvedores \npara uma conciliação perfeita",
                      ),
                      Opcoes(titulo: "Integração com ERPs, TEFs e BACEN."),
                      Opcoes(titulo: "SLA e atendimento diferenciado"),
                      Opcoes(
                        titulo:
                            "Consultoria de melhores práticas \napós 90 dias de uso",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BannerPromocional(),
          ],
        ),
      ),
    );
  }
}
