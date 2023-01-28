import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shop_app/app/utils/constans/color/constans_colors.dart';
import 'package:shop_app/app/utils/constans/style/constans_styles.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  _WelcomPageState createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  static const colorizeColors = [
    ConstansColor.blue,
    ConstansColor.green,
    ConstansColor.cyan,
    ConstansColor.brown,
    ConstansColor.amber,
  ];
  static const colorTextStyle = ConstansStyle.fo50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/inapp/bgimage.jpg'),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(children: [
          SizedBox(
            width: 250.0,
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ColorizeAnimatedText(
                  'Hello',
                  textStyle: colorTextStyle,
                  colors: colorizeColors,
                ),
                ColorizeAnimatedText(
                  "Welcom",
                  textStyle: colorTextStyle,
                  colors: colorizeColors,
                ),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print(" Log ======>");
              },
            ),
          ),
        ])),
      ),
    );
  }
}
