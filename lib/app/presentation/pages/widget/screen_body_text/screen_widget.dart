import 'package:flutter/material.dart';
import 'package:shop_app/app/utils/constans/style/constans_styles.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({
    Key? key,
    required this.textscreen
  }) : super(key: key);
final String textscreen;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(textscreen, style: ConstansStyle.grey15,));
  }
}
