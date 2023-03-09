import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

class GoogleFacebookGuestWidget extends StatelessWidget {
  const GoogleFacebookGuestWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.image,
  });

  final String title;
  final Function() onTap;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          image,
          Text(
            title,
            style: TextStyle(fontSize: 18, color: AppColors.black26),
          ),
        ],
      ),
    );
  }
}
