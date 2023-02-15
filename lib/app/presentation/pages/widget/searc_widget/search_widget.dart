import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../utils/constans/color/constans_colors.dart';
import '../../../../utils/constans/style/constans_styles.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
      width: double.infinity,
      height: 90,
      child: TextField(
        controller: _textEditingController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(),
          fillColor: ConstansColor.orange,
          filled: true,
          prefixIcon: Icon(
            Icons.search_rounded,
            color: ConstansColor.orange2,
          ),
          hintText: "Поиск",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ConstansColor.blueGrotto.withOpacity(0.7), width: 1),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide:
                  BorderSide(width: 3, color: ConstansColor.blueGrotto)),
        ),
      ),
    );
  }
}
