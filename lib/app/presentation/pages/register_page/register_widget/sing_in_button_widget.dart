import 'package:flutter/material.dart';

import '../../../../utils/constans/color/constans_colors.dart';

class SingInButtonWidget extends StatelessWidget {
  const SingInButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ConstansColor.purple, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 150,
          vertical: 15,
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
