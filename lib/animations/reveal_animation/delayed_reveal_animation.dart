import 'dart:async';

import 'package:flutter/material.dart';

class DelayedRevealAnimation extends StatefulWidget {
  const DelayedRevealAnimation({
    super.key,
    required this.child,
    required this.delay,
  });

  final Widget child;
  final Duration delay;

  @override
  State<DelayedRevealAnimation> createState() => _DelayedRevealAnimationState();
}

class _DelayedRevealAnimationState extends State<DelayedRevealAnimation>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _timer = Timer(
      widget.delay,
      () {
        if (mounted) {
          _controller.forward();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(0.0, (1 - _animation.value) * 20.0),
            child: child,
          ),
        );
      },
    );
  }
}
