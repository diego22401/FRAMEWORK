import 'package:flutter/material.dart';

class TelaJogos extends StatelessWidget {
  const TelaJogos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogos'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.sports_esports, size: 72, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              'Meus Jogos Favoritos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 12),
            const Text(
              '🎮 The Legend of Zelda\n🎮 Red Dead Redemption 2\n🎮 Hollow Knight\n🎮 Minecraft',
              style: TextStyle(fontSize: 16, height: 2),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
