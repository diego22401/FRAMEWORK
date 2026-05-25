import 'package:flutter/material.dart';

class TelaMusicas extends StatelessWidget {
  const TelaMusicas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Músicas'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.music_note, size: 72, color: Colors.purple),
            const SizedBox(height: 16),
            const Text(
              'Minhas Músicas Favoritas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            const SizedBox(height: 12),
            const Text(
              '🎵 Bohemian Rhapsody — Queen\n🎵 Stairway to Heaven — Led Zeppelin\n🎵 Smells Like Teen Spirit — Nirvana\n🎵 Hotel California — Eagles',
              style: TextStyle(fontSize: 16, height: 2),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
