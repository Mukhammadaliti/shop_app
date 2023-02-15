import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/utils/constans/style/constans_styles.dart';

import '../../../../utils/animation_colors_list/animation_color_util.dart';

class ColorizeAnimationWidget extends StatelessWidget {
  ColorizeAnimationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        ColorizeAnimatedText(
          'Welcome To Duck Store',
          textStyle: ConstansStyle.animationText,
          colors: AnimationColorListUtil.ConstanttextColor,
        ),
      ],
      // onTap: () {
      //   print("Tap Event");
      // },
    );
  }
}
