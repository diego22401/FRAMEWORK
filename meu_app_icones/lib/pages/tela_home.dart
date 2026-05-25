import 'package:flutter/material.dart';
import '../widgets/card_icone.dart';
import 'tela_filmes.dart';
import 'tela_jogos.dart';
import 'tela_musicas.dart';
import 'tela_estudos.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

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
          CardIcone(
            icone: Icons.movie,
            titulo: 'Filmes',
            descricao: 'Veja minha lista de filmes favoritos.',
            textoBotao: 'Ver Filmes',
            cor: Colors.indigo,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TelaFilmes()),
            ),
          ),
          CardIcone(
            icone: Icons.sports_esports,
            titulo: 'Jogos',
            descricao: 'Confira os jogos que mais curto.',
            textoBotao: 'Ver Jogos',
            cor: Colors.green,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TelaJogos()),
            ),
          ),
          CardIcone(
            icone: Icons.music_note,
            titulo: 'Músicas',
            descricao: 'Minhas músicas e bandas favoritas.',
            textoBotao: 'Ver Músicas',
            cor: Colors.purple,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TelaMusicas()),
            ),
          ),
          CardIcone(
            icone: Icons.school,
            titulo: 'Estudos',
            descricao: 'O que estou estudando agora.',
            textoBotao: 'Ver Estudos',
            cor: Colors.orange,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TelaEstudos()),
            ),
          ),
          CardIcone(
            icone: Icons.notifications,
            titulo: 'Notificações',
            descricao: 'Veja um aviso rápido sobre o app.',
            textoBotao: 'Ver Aviso',
            cor: Colors.red,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(24),
                    height: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '🔔 Aviso Importante',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Este app foi criado como projeto prático de Flutter. Navegue pelos cards para explorar os conteúdos!',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Fechar'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
