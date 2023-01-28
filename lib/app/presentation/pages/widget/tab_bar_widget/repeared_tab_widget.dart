import 'package:flutter/material.dart';

import '../../../../utils/constans/style/constans_styles.dart';

class RepeatedTabWidget extends StatelessWidget {
  const RepeatedTabWidget({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(name, style: ConstansStyle.black87S18,),
    );
  }
}