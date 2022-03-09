import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  const GradientText({
    Key? key,
    required this.text,
    required this.gradient,
    this.textStyle,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      // set the BlendMode to BlendMode.srcIn,
      // "src" means the widget to apply the gradient to (in this case Text),
      // "in" means only show the part of the Text where it overlaps with
      // the background which is the text itself (so the gradient doesn't
      // get applied on the background)
      blendMode: BlendMode.srcIn,
      child: Text(text, textAlign: textAlign, style: textStyle),
    );
  }
}
