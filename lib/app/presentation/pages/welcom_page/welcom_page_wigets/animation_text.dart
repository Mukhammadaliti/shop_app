import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimationText extends StatefulWidget {
  const AnimationText({
    super.key,
    required this.colorTextStyle,
    required this.colorizeColors,
    required this.titelText,
  });

  final TextStyle colorTextStyle;
  final List<Color> colorizeColors;
  final String? titelText;

  @override
  State<AnimationText> createState() => _AnimationTextState();
}

class _AnimationTextState extends State<AnimationText> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        ColorizeAnimatedText(
          widget.titelText!,
          textStyle: widget.colorTextStyle,
          colors: widget.colorizeColors,
        ),
      ],
      isRepeatingAnimation: true,
    );
  }
}