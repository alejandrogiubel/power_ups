[![Codacy Badge](https://app.codacy.com/project/badge/Grade/b3aa388977054e389067df8116394d99)](https://www.codacy.com/gh/alejandrogiubel/power_ups/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=alejandrogiubel/power_ups&amp;utm_campaign=Badge_Grade)

A group of widgets, methods and extension to improve your coding experience.
Some features were taken from this great repository of flutter and dart tricks:
[flutter-tips-and-tricks](https://github.com/vandadnp/flutter-tips-and-tricks).

Other features were obtained from stack overflow and others blogs 😅. Thanks to all of them.

## Features
* Animations
    - Reveal animation
    - Shake animation

* Extensions
    - Duration
    - Iterable
    - String
    - Widget

## Usage

* Reveal animation
```dart
widget.withRevealAnimation
```

* Delayed reveal animation
```dart
widget.withDelayedRevealAnimation(const Duration(microseconds: 200))
```

* Shake animation
```dart
late AnimationController animationController;

widget.withShakeAnimation(
  (controller) {
    animationController = controller;
  },
  animationWidth: 5, //Horizontal size of the animation. Optional. Default 10.
  animationDuration: Duration(milliseconds: 100) //Animation duration. Optional. Default 370 milliseconds.
),

ElevatedButton(
  onPressed: () {
    animationController.forward(from: 0.0);
  },
  child: Text('Do shake'),
),
```

* Map with index
```dart
List list = ['apple, banana, mango'];
list.mapWithIndex(
  (index, value) {
    print(index);
    print(value);
  },
);
```

* String utils
```dart
String name = 'john doe';
name.inCapitalizeFirst; // John doe
name.allInCaps; //JOHN DOE
name.capitalizeFirstOfEach; // John Doe
```

* Duration to text
```dart
Duration duration = const Duration(seconds: 3);
print(duration.toText()); // 00:03
```

## Additional information

PR are welcome
