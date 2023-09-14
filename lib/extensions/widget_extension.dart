import 'package:flutter/material.dart';
import 'package:power_ups/animations/animations.dart';

extension WidgetExtension on Widget {
  Widget get withRevealAnimation {
    return RevealAnimation(
      child: this,
    );
  }

  Widget withShakeAnimation(
    Function(AnimationController) onInit, {
    Duration animationDuration = const Duration(milliseconds: 370),
    double animationWidth = 10,
  }) {
    return ShakeAnimation(
      onInit: onInit,
      animationDuration: animationDuration,
      animationWidth: animationWidth,
      child: this,
    );
  }

  Widget withDelayedRevealAnimation(Duration duration) {
    return DelayedRevealAnimation(
      delay: duration,
      child: this,
    );
  }

  ///Vertical padding
  Widget vp(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  ///Horizontal padding
  Widget hp(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  ///Symmetric padding (vertical padding, horizontal padding)
  Widget sp(double verticalPadding, double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: this,
    );
  }

  ///Top padding
  Widget tp(double padding) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: this,
    );
  }

  ///Bottom padding
  Widget bp(double padding) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: this,
    );
  }

  ///Left padding
  Widget lp(double padding) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: this,
    );
  }

  ///Right padding
  Widget rp(double padding) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: this,
    );
  }

  ///All padding
  Widget ap(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget expanded() {
    return Expanded(
      child: this,
    );
  }

  Widget flexible() {
    return Flexible(
      child: this,
    );
  }
}
