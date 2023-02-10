import 'package:flutter/material.dart';
import 'package:shop_app/app/utils/constans/color/constans_colors.dart';

class CameraChoiceWidget extends StatelessWidget {
  const CameraChoiceWidget(
      {Key? key,
      required this.radiusOnly,
      required this.icon,
      required this.onpress})
      : super(key: key);
  final BorderRadiusGeometry radiusOnly;
  final IconData icon;
  final Function() onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: radiusOnly, color: ConstansColor.purpleAccent),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(
            icon,
            size: 25,
            color: ConstansColor.white,
          ),
        ),
      ),
    );
  }
}
