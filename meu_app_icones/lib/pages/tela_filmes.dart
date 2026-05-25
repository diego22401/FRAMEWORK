import 'package:flutter/material.dart';

class TelaFilmes extends StatelessWidget {
  const TelaFilmes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.movie, size: 72, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'Meus Filmes Favoritos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 12),
            const Text(
              '🎬 Interestelar\n🎬 O Poderoso Chefão\n🎬 Matrix\n🎬 Clube da Luta',
              style: TextStyle(fontSize: 16, height: 2),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
