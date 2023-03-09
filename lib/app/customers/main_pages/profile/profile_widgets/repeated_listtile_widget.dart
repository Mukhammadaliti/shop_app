import 'package:flutter/material.dart';

class RepeatedListTile extends StatelessWidget {
  const RepeatedListTile({
    Key? key,
    required this.title,
    this.subTitle = '',
    required this.icon,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subTitle),
      ),
    );
  }
}
