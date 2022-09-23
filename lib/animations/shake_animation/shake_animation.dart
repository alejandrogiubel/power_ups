import 'package:flutter/material.dart';

class ShakeAnimation extends StatefulWidget {
  const ShakeAnimation({
    super.key,
    required this.child,
    required this.onInit,
  });
  final Widget child;

  ///This callback return the used AnimationController.
  final Function(AnimationController) onInit;

  @override
  State<ShakeAnimation> createState() => _ShakeAnimationState();
}

const animationWidth = 10.0;

class _ShakeAnimationState extends State<ShakeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _offsetAnim;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 370),
      vsync: this,
    );
    _offsetAnim = Tween(
      begin: 0.0,
      end: animationWidth,
    ).chain(CurveTween(curve: Curves.elasticIn)).animate(
          _animationController,
        )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _animationController.reverse();
          }
        },
      );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.onInit.call(_animationController);
    return AnimatedBuilder(
      animation: _offsetAnim,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: animationWidth,
          ),
          padding: EdgeInsets.only(
            left: _offsetAnim.value + animationWidth,
            right: animationWidth - _offsetAnim.value,
          ),
          child: widget.child,
        );
      },
    );
  }
}
