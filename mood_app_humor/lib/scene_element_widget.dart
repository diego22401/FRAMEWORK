import 'package:flutter/material.dart';
import 'mood_model.dart';

class SceneElementWidget extends StatefulWidget {
  final SceneElement element;
  final bool isVisible;

  const SceneElementWidget({
    super.key,
    required this.element,
    required this.isVisible,
  });

  @override
  State<SceneElementWidget> createState() => _SceneElementWidgetState();
}

class _SceneElementWidgetState extends State<SceneElementWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    switch (widget.element.animationType) {
      case SceneAnimationType.float:
        _controller = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 2400),
        );
        _animation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        );
        _controller.repeat(reverse: true);
        break;

      case SceneAnimationType.pulse:
        _controller = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 900),
        );
        _animation = Tween<double>(begin: 0.85, end: 1.15).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        );
        _controller.repeat(reverse: true);
        break;

      case SceneAnimationType.spin:
        _controller = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 2000),
        );
        _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
        _controller.repeat();
        break;

      case SceneAnimationType.fall:
        _controller = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 1600),
        );
        _animation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeIn),
        );
        Future.delayed(
          Duration(
            milliseconds: (widget.element.animationDelay * 1000).toInt(),
          ),
          () {
            if (mounted) _controller.repeat();
          },
        );
        break;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isVisible ? 1.0 : 0.0,
      duration: Duration(
        milliseconds: 500 + (widget.element.animationDelay * 400).toInt(),
      ),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          Widget iconWidget = Icon(
            widget.element.icon,
            size: widget.element.size,
            color: widget.element.color,
          );

          switch (widget.element.animationType) {
            case SceneAnimationType.float:
              return Transform.translate(
                offset: Offset(0, -8 + _animation.value * 16),
                child: iconWidget,
              );

            case SceneAnimationType.pulse:
              return Transform.scale(
                scale: _animation.value,
                child: iconWidget,
              );

            case SceneAnimationType.spin:
              return Transform.rotate(
                angle: _animation.value * 2 * 3.14159,
                child: iconWidget,
              );

            case SceneAnimationType.fall:
              return Transform.translate(
                offset: Offset(0, _animation.value * 40),
                child: Opacity(
                  opacity: 1 - (_animation.value * 0.7),
                  child: iconWidget,
                ),
              );
          }
        },
      ),
    );
  }
}
