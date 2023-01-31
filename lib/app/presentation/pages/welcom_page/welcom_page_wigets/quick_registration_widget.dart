import 'package:flutter/material.dart';
import 'package:shop_app/app/utils/constans/style/constans_styles.dart';

class QuickRegistrationWidget extends StatelessWidget {
  const QuickRegistrationWidget(
      {Key? key,
      required this.title,
      required this.pressed,
      required this.regImage,
      })
      : super(key: key);
  final String title;
  final Function() pressed;
  final Image regImage;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Column(
        children: [
          Image.asset(regImage.toString(), width: 70,),
          Text(title, style: ConstansStyle.white18,)
        ],
      ),
    );
  }
}
