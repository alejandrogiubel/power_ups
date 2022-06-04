import 'package:flutter/material.dart';
import 'package:power_ups/animations/reveal_animation/delayed_reveal_animation.dart';

class RevealAnimation extends StatefulWidget {
  const RevealAnimation({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<RevealAnimation> createState() => _RevealAnimationState();
}

class _RevealAnimationState extends State<RevealAnimation> {
  @override
  void initState() {
    super.initState();
    _getDelay();
  }

  Duration _dominoDelay = Duration.zero;

  Duration _getDelay() {
    return _dominoDelay += const Duration(milliseconds: 100);
  }

  @override
  Widget build(BuildContext context) {
    return DelayedRevealAnimation(
      delay: _getDelay(),
      child: widget.child,
    );
  }
}
