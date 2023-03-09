import 'package:flutter/material.dart';

class RepeatedTabBarWidget extends StatelessWidget {
  const RepeatedTabBarWidget({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
