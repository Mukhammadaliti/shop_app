import 'package:flutter/material.dart';
import 'package:shop_app/app/utils/constans/style/constans_styles.dart';

class QuickRegistrationWidget extends StatelessWidget {
  const QuickRegistrationWidget({
    Key? key,
    required this.title,
    required this.pressed,
    required this.image,
  }) : super(key: key);
  final String title;
  final Function() pressed;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Column(
        children: [
          image,
          Text(
            title,
            style: ConstansStyle.white18,
          )
        ],
      ),
    );
  }
}
