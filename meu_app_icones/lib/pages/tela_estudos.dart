import 'package:flutter/material.dart';

class TelaEstudos extends StatelessWidget {
  const TelaEstudos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudos'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.school, size: 72, color: Colors.orange),
            const SizedBox(height: 16),
            const Text(
              'Meus Estudos Atuais',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 12),
            const Text(
              '📚 Flutter & Dart\n📚 Estruturas de Dados\n📚 Inglês Técnico\n📚 Algoritmos',
              style: TextStyle(fontSize: 16, height: 2),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
            const Spacer(),
            const Text(
              'Desenvolvido por: Seu Nome',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
