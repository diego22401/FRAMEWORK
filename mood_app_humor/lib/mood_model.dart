import 'package:flutter/material.dart';

class MoodData {
  final String name;
  final Color color;
  final Color darkColor;
  final IconData icon;
  final String title;
  final String message;
  final String extraMessage;
  final double borderRadius;
  final List<SceneElement> sceneElements;

  const MoodData({
    required this.name,
    required this.color,
    required this.darkColor,
    required this.icon,
    required this.title,
    required this.message,
    required this.extraMessage,
    required this.borderRadius,
    required this.sceneElements,
  });
}

class SceneElement {
  final IconData icon;
  final double size;
  final Color color;
  final double top;
  final double left;
  final double animationDelay;
  final SceneAnimationType animationType;

  const SceneElement({
    required this.icon,
    required this.size,
    required this.color,
    required this.top,
    required this.left,
    required this.animationDelay,
    this.animationType = SceneAnimationType.float,
  });
}

enum SceneAnimationType { float, pulse, spin, fall }

final List<MoodData> moods = [
  MoodData(
    name: 'Feliz',
    color: const Color(0xFFFFD93D),
    darkColor: const Color(0xFFF4A800),
    icon: Icons.sentiment_very_satisfied_rounded,
    title: 'Hoje estou Feliz! 😄',
    message: 'Que energia incrível você está emanando!',
    extraMessage:
        'Você escolheu o humor Feliz.\nQue bom ver essa energia positiva!',
    borderRadius: 60,
    sceneElements: [
      SceneElement(
        icon: Icons.wb_sunny_rounded,
        size: 64,
        color: Color(0xFFFF9500),
        top: 10,
        left: 120,
        animationDelay: 0,
        animationType: SceneAnimationType.pulse,
      ),
      SceneElement(
        icon: Icons.star_rounded,
        size: 28,
        color: Color(0xFFFFB800),
        top: 20,
        left: 40,
        animationDelay: 0.2,
        animationType: SceneAnimationType.float,
      ),
      SceneElement(
        icon: Icons.star_rounded,
        size: 20,
        color: Color(0xFFFFD93D),
        top: 60,
        left: 240,
        animationDelay: 0.4,
        animationType: SceneAnimationType.float,
      ),
      SceneElement(
        icon: Icons.auto_awesome,
        size: 24,
        color: Color(0xFFFFB800),
        top: 80,
        left: 30,
        animationDelay: 0.6,
        animationType: SceneAnimationType.pulse,
      ),
      SceneElement(
        icon: Icons.auto_awesome,
        size: 18,
        color: Color(0xFFFF9500),
        top: 30,
        left: 210,
        animationDelay: 0.3,
        animationType: SceneAnimationType.pulse,
      ),
    ],
  ),
  MoodData(
    name: 'Triste',
    color: const Color(0xFF78A6C8),
    darkColor: const Color(0xFF4A7FA5),
    icon: Icons.sentiment_very_dissatisfied_rounded,
    title: 'Me sinto Triste... 😢',
    message: 'Tudo bem. Cada sentimento tem seu tempo.',
    extraMessage:
        'Você escolheu o humor Triste.\nÉ normal se sentir assim às vezes. Respira fundo.',
    borderRadius: 16,
    sceneElements: [
      SceneElement(
        icon: Icons.cloud_rounded,
        size: 56,
        color: Color(0xFF90AAC4),
        top: 10,
        left: 80,
        animationDelay: 0,
        animationType: SceneAnimationType.float,
      ),
      SceneElement(
        icon: Icons.water_drop_rounded,
        size: 22,
        color: Color(0xFF5B8DB8),
        top: 60,
        left: 100,
        animationDelay: 0.2,
        animationType: SceneAnimationType.fall,
      ),
      SceneElement(
        icon: Icons.water_drop_rounded,
        size: 18,
        color: Color(0xFF5B8DB8),
        top: 55,
        left: 140,
        animationDelay: 0.5,
        animationType: SceneAnimationType.fall,
      ),
      SceneElement(
        icon: Icons.water_drop_rounded,
        size: 20,
        color: Color(0xFF5B8DB8),
        top: 65,
        left: 170,
        animationDelay: 0.8,
        animationType: SceneAnimationType.fall,
      ),
      SceneElement(
        icon: Icons.cloud_rounded,
        size: 36,
        color: Color(0xFF7A9CB8),
        top: 20,
        left: 190,
        animationDelay: 0.3,
        animationType: SceneAnimationType.float,
      ),
    ],
  ),
  MoodData(
    name: 'Animado',
    color: const Color(0xFFFF6B35),
    darkColor: const Color(0xFFE04E1A),
    icon: Icons.bolt_rounded,
    title: 'Energia Total! ⚡',
    message: 'Nada pode te parar hoje!',
    extraMessage:
        'Você escolheu o humor Animado.\nEssa energia é contagiante! Vai com tudo!',
    borderRadius: 8,
    sceneElements: [
      SceneElement(
        icon: Icons.bolt_rounded,
        size: 52,
        color: Color(0xFFFFD700),
        top: 10,
        left: 130,
        animationDelay: 0,
        animationType: SceneAnimationType.pulse,
      ),
      SceneElement(
        icon: Icons.star_rounded,
        size: 30,
        color: Color(0xFFFFEB3B),
        top: 20,
        left: 50,
        animationDelay: 0.15,
        animationType: SceneAnimationType.spin,
      ),
      SceneElement(
        icon: Icons.flash_on_rounded,
        size: 26,
        color: Color(0xFFFFD700),
        top: 50,
        left: 220,
        animationDelay: 0.3,
        animationType: SceneAnimationType.pulse,
      ),
      SceneElement(
        icon: Icons.star_rounded,
        size: 20,
        color: Color(0xFFFFEB3B),
        top: 70,
        left: 40,
        animationDelay: 0.45,
        animationType: SceneAnimationType.spin,
      ),
      SceneElement(
        icon: Icons.flash_on_rounded,
        size: 22,
        color: Color(0xFFFFD700),
        top: 30,
        left: 250,
        animationDelay: 0.6,
        animationType: SceneAnimationType.pulse,
      ),
    ],
  ),
  MoodData(
    name: 'Calmo',
    color: const Color(0xFF7EC8C8),
    darkColor: const Color(0xFF4AA8A8),
    icon: Icons.spa_rounded,
    title: 'Momento de Paz ☁️',
    message: 'Tranquilidade é um presente.',
    extraMessage:
        'Você escolheu o humor Calmo.\nMomento de tranquilidade. Aproveite essa paz.',
    borderRadius: 40,
    sceneElements: [
      SceneElement(
        icon: Icons.cloud_rounded,
        size: 48,
        color: Color(0xFFB2E0E0),
        top: 10,
        left: 60,
        animationDelay: 0,
        animationType: SceneAnimationType.float,
      ),
      SceneElement(
        icon: Icons.cloud_rounded,
        size: 36,
        color: Color(0xFF9DD5D5),
        top: 30,
        left: 190,
        animationDelay: 0.5,
        animationType: SceneAnimationType.float,
      ),
      SceneElement(
        icon: Icons.water_rounded,
        size: 28,
        color: Color(0xFF5BB8B8),
        top: 70,
        left: 110,
        animationDelay: 0.3,
        animationType: SceneAnimationType.pulse,
      ),
      SceneElement(
        icon: Icons.air_rounded,
        size: 22,
        color: Color(0xFF8DD4D4),
        top: 55,
        left: 30,
        animationDelay: 0.7,
        animationType: SceneAnimationType.float,
      ),
      SceneElement(
        icon: Icons.cloud_rounded,
        size: 24,
        color: Color(0xFFB2E0E0),
        top: 15,
        left: 240,
        animationDelay: 0.9,
        animationType: SceneAnimationType.float,
      ),
    ],
  ),
  MoodData(
    name: 'Bravo',
    color: const Color(0xFFE05C5C),
    darkColor: const Color(0xFFC03030),
    icon: Icons.sentiment_very_dissatisfied_rounded,
    title: 'Estou Bravo! 😤',
    message: 'Respira fundo. Isso vai passar.',
    extraMessage:
        'Você escolheu o humor Bravo.\nRespira. Cada tempestade tem seu fim.',
    borderRadius: 4,
    sceneElements: [
      SceneElement(
        icon: Icons.local_fire_department_rounded,
        size: 56,
        color: Color(0xFFFF6B00),
        top: 8,
        left: 120,
        animationDelay: 0,
        animationType: SceneAnimationType.pulse,
      ),
      SceneElement(
        icon: Icons.local_fire_department_rounded,
        size: 36,
        color: Color(0xFFFF8C00),
        top: 30,
        left: 50,
        animationDelay: 0.2,
        animationType: SceneAnimationType.pulse,
      ),
      SceneElement(
        icon: Icons.local_fire_department_rounded,
        size: 30,
        color: Color(0xFFFF6B00),
        top: 25,
        left: 215,
        animationDelay: 0.4,
        animationType: SceneAnimationType.pulse,
      ),
      SceneElement(
        icon: Icons.thunderstorm_rounded,
        size: 26,
        color: Color(0xFFCC2200),
        top: 65,
        left: 30,
        animationDelay: 0.3,
        animationType: SceneAnimationType.spin,
      ),
      SceneElement(
        icon: Icons.thunderstorm_rounded,
        size: 22,
        color: Color(0xFFCC2200),
        top: 70,
        left: 220,
        animationDelay: 0.6,
        animationType: SceneAnimationType.spin,
      ),
    ],
  ),
  MoodData(
    name: 'Surpreso',
    color: const Color(0xFFB57BEE),
    darkColor: const Color(0xFF8A4FCC),
    icon: Icons.sentiment_neutral_rounded,
    title: 'Que Surpresa! 😲',
    message: 'A vida é cheia de surpresas incríveis!',
    extraMessage:
        'Você escolheu o humor Surpreso.\nA vida sempre tem algo novo para nos surpreender!',
    borderRadius: 50,
    sceneElements: [
      SceneElement(
        icon: Icons.celebration_rounded,
        size: 52,
        color: Color(0xFFFFD700),
        top: 8,
        left: 120,
        animationDelay: 0,
        animationType: SceneAnimationType.spin,
      ),
      SceneElement(
        icon: Icons.star_rounded,
        size: 28,
        color: Color(0xFFFF9FE5),
        top: 25,
        left: 45,
        animationDelay: 0.2,
        animationType: SceneAnimationType.float,
      ),
      SceneElement(
        icon: Icons.star_rounded,
        size: 22,
        color: Color(0xFF9FECFF),
        top: 20,
        left: 220,
        animationDelay: 0.4,
        animationType: SceneAnimationType.float,
      ),
      SceneElement(
        icon: Icons.auto_awesome,
        size: 26,
        color: Color(0xFFFFD700),
        top: 65,
        left: 30,
        animationDelay: 0.6,
        animationType: SceneAnimationType.spin,
      ),
      SceneElement(
        icon: Icons.auto_awesome,
        size: 20,
        color: Color(0xFFFF9FE5),
        top: 70,
        left: 230,
        animationDelay: 0.8,
        animationType: SceneAnimationType.pulse,
      ),
    ],
  ),
];
