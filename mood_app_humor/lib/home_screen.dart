import 'package:flutter/material.dart';
import 'mood_model.dart';
import 'scene_element_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MoodData? _selectedMood;
  bool _showMessage = false;
  bool _showScene = false;

  static const Duration _animDuration = Duration(milliseconds: 600);

  void _selectMood(MoodData mood) {
    setState(() {
      _showMessage = false;
      _showScene = false;
      _selectedMood = mood;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _showMessage = true;
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() {
          _showScene = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hasSelection = _selectedMood != null;
    final bgColor = hasSelection ? _selectedMood!.color : const Color(0xFFF0F0F8);
    final containerSize = hasSelection ? size.width * 0.88 : size.width * 0.72;
    final borderRadius = hasSelection ? _selectedMood!.borderRadius : 24.0;

    return Scaffold(
      backgroundColor: hasSelection
          ? _selectedMood!.darkColor
          : const Color(0xFF2D2D44),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height - MediaQuery.of(context).padding.top),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header
                  _buildHeader(hasSelection),
                  const SizedBox(height: 20),

                  // Animated main container
                  Center(
                    child: AnimatedContainer(
                      duration: _animDuration,
                      curve: Curves.easeInOutCubic,
                      width: containerSize,
                      constraints: const BoxConstraints(maxWidth: 340),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(borderRadius),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Scene
                          if (hasSelection) _buildScene(),

                          // Icon
                          AnimatedSwitcher(
                            duration: _animDuration,
                            transitionBuilder: (child, anim) =>
                                ScaleTransition(scale: anim, child: child),
                            child: Icon(
                              hasSelection
                                  ? _selectedMood!.icon
                                  : Icons.mood_rounded,
                              key: ValueKey(
                                  hasSelection ? _selectedMood!.name : 'default'),
                              size: hasSelection ? 80 : 64,
                              color: hasSelection
                                  ? _selectedMood!.darkColor
                                  : Colors.grey.shade400,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Title / prompt
                          AnimatedSwitcher(
                            duration: _animDuration,
                            child: Text(
                              hasSelection
                                  ? _selectedMood!.title
                                  : 'Como você está hoje?',
                              key: ValueKey(
                                  hasSelection ? _selectedMood!.name : 'default'),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: hasSelection ? 20 : 16,
                                fontWeight: FontWeight.bold,
                                color: hasSelection
                                    ? _selectedMood!.darkColor
                                    : Colors.grey.shade600,
                              ),
                            ),
                          ),

                          if (hasSelection) ...[
                            const SizedBox(height: 8),
                            Text(
                              _selectedMood!.message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: _selectedMood!.darkColor.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Animated opacity message
                  AnimatedOpacity(
                    opacity: _showMessage ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 700),
                    child: AnimatedContainer(
                      duration: _animDuration,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                      child: Text(
                        _selectedMood?.extraMessage ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),

                  if (_showMessage) const SizedBox(height: 16),

                  // Mood buttons
                  _buildMoodButtons(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool hasSelection) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_rounded,
              color: hasSelection
                  ? _selectedMood!.color
                  : const Color(0xFFFF6B9D),
              size: 22,
            ),
            const SizedBox(width: 8),
            const Text(
              'Mood App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.favorite_rounded,
              color: hasSelection
                  ? _selectedMood!.color
                  : const Color(0xFFFF6B9D),
              size: 22,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          hasSelection
              ? 'Humor selecionado: ${_selectedMood!.name}'
              : 'Escolha seu humor e veja a magia!',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildScene() {
    final elements = _selectedMood!.sceneElements;
    return SizedBox(
      height: 110,
      child: Stack(
        clipBehavior: Clip.none,
        children: elements.asMap().entries.map((entry) {
          final el = entry.value;
          return Positioned(
            top: el.top,
            left: el.left,
            child: SceneElementWidget(
              element: el,
              isVisible: _showScene,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMoodButtons() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: moods.map((mood) {
        final isSelected = _selectedMood?.name == mood.name;
        return GestureDetector(
          onTap: () => _selectMood(mood),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? mood.color : Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isSelected ? mood.darkColor : Colors.white.withOpacity(0.3),
                width: isSelected ? 2.5 : 1.5,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: mood.color.withOpacity(0.5),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  mood.icon,
                  size: 20,
                  color: isSelected ? mood.darkColor : Colors.white,
                ),
                const SizedBox(width: 6),
                Text(
                  mood.name,
                  style: TextStyle(
                    color: isSelected ? mood.darkColor : Colors.white,
                    fontWeight:
                        isSelected ? FontWeight.w800 : FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
