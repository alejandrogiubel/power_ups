import 'package:flutter/material.dart';
import 'package:power_ups/animations/animations.dart';

extension WidgetExtension on Widget {
  Widget get withRevealAnimation {
    return RevealAnimation(
      child: this,
    );
  }

  Widget withShakeAnimation(Function(AnimationController) onInit) {
    return ShakeAnimation(
      onInit: onInit,
      child: this,
    );
  }

  Widget withDelayedRevealAnimation(Duration duration) {
    return DelayedRevealAnimation(
      delay: duration,
      child: this,
    );
  }

  Widget verticalPadding(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  Widget horizontalPadding(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget symmetricPadding(double verticalPadding, double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: this,
    );
  }
}
