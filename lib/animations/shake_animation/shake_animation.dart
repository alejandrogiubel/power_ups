import 'package:flutter/material.dart';

class ShakeAnimation extends StatefulWidget {
  const ShakeAnimation({
    super.key,
    required this.child,
    required this.onInit,
    this.animationWidth = 10,
    this.animationDuration = const Duration(milliseconds: 370),
  });
  final Widget child;
  final double animationWidth;
  final Duration animationDuration;

  ///This callback return the used AnimationController.
  ///Them assign this controller to your external controller
  ///to handle the animation.
  ///
  /// To handle the animation just use controller.forward(from: 0.0);
  final Function(AnimationController) onInit;

  @override
  State<ShakeAnimation> createState() => _ShakeAnimationState();
}

class _ShakeAnimationState extends State<ShakeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _offsetAnim;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _offsetAnim = Tween(
      begin: 0.0,
      end: widget.animationWidth,
    ).chain(CurveTween(curve: Curves.elasticIn)).animate(
          _animationController,
        )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _animationController.reverse();
          }
        },
      );
    widget.onInit.call(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offsetAnim,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: widget.animationWidth,
          ),
          padding: EdgeInsets.only(
            left: _offsetAnim.value + widget.animationWidth,
            right: widget.animationWidth - _offsetAnim.value,
          ),
          child: widget.child,
        );
      },
    );
  }
}
