import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

class LogSignWidget extends StatelessWidget {
  const LogSignWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.yellow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
