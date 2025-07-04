import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../componentes/botao_aredondado.dart';
import '../helps/cores.dart';

class FormularioWhatsApp extends StatefulWidget {
  const FormularioWhatsApp({super.key});

  @override
  State<FormularioWhatsApp> createState() => _FormularioWhatsAppState();
}

class _FormularioWhatsAppState extends State<FormularioWhatsApp> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  String telefoneCompleto = '';

  void iniciarConversa() async {
    if (telefoneCompleto.isEmpty) return;

    final uri = Uri.parse(
      'https://web.whatsapp.com/send?phone=$telefoneCompleto&text=Vamos+conversar%3F',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível abrir o WhatsApp.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Topo
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: PaletaCor.verde_escuro,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Olá!\nPreencha os campos abaixo para iniciar a conversa no WhatsApp.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Campos
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  IntlPhoneField(
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                      border: OutlineInputBorder(),
                    ),
                    initialCountryCode: 'BR',
                    onChanged: (phone) {
                      telefoneCompleto = phone.completeNumber.replaceAll(
                        RegExp(r'\D'),
                        '',
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  BotaoAredondado(
                    Cor: PaletaCor.verde_escuro,
                    width: double.infinity,
                    centralizado: true,
                    height: 50,
                    titulo: 'Iniciar a conversa',
                    acao: iniciarConversa,
                  ),
                  const SizedBox(height: 10),
                  BotaoAredondado(
                    Cor: PaletaCor.verde_claro_amarelo,
                    centralizado: true,
                    height: 50,
                    width: double.infinity,
                    titulo: 'Para suporte/financeiro/dúvidas clique aqui',
                    acao: iniciarConversa,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
