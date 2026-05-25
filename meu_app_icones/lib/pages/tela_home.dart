import 'package:flutter/material.dart';
import '../widgets/card_icone.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String mensagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App de Ícones'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (mensagem.isNotEmpty)
            Text(
              mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.indigo),
            ),

          const SizedBox(height: 12),

          CardIcone(
            icone: Icons.person,
            titulo: 'Perfil',
            descricao: 'Veja suas informações pessoais.',
            textoBotao: 'Acessar',
            cor: Colors.indigo,
            onPressed: () {
              setState(() {
                mensagem = 'Você clicou em Perfil';
              });
            },
          ),

          CardIcone(
            icone: Icons.settings,
            titulo: 'Configurações',
            descricao: 'Ajuste as preferências do app.',
            textoBotao: 'Configurar',
            cor: Colors.teal,
            onPressed: () {
              setState(() {
                mensagem = 'Você clicou em Configurações';
              });
            },
          ),

          CardIcone(
            icone: Icons.favorite,
            titulo: 'Favoritos',
            descricao: 'Veja seus itens favoritos.',
            textoBotao: 'Ver Favoritos',
            cor: Colors.red,
            onPressed: () {
              setState(() {
                mensagem = 'Você clicou em Favoritos';
              });
            },
          ),

          CardIcone(
            icone: Icons.notifications,
            titulo: 'Notificações',
            descricao: 'Veja seus alertas.',
            textoBotao: 'Ver Alertas',
            cor: Colors.orange,
            onPressed: () {
              setState(() {
                mensagem = 'Você clicou em Notificações';
              });
            },
          ),
        ],
      ),
    );
  }
}
