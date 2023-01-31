import 'package:flutter/material.dart';
import 'package:shop_app/app/utils/constans/color/constans_colors.dart';
import 'package:shop_app/app/utils/constans/style/constans_styles.dart';

class LogSignWidget extends StatelessWidget {
  const LogSignWidget({Key? key, required this.write, required this.tap})
      : super(key: key);
  final String write;
  final Function() tap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ConstansColor.yellow),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
          child: Text(
            write,
            style: ConstansStyle.black15w600,
          ),
        ),
      ),
    );
  }
}
