import 'package:flutter/material.dart';
import 'pages/tela_home.dart';

void main() {
  runApp(const MeuAppIcones());
}

class MeuAppIcones extends StatelessWidget {
  const MeuAppIcones({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App de Ícones',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const TelaHome(),
    );
  }
}
