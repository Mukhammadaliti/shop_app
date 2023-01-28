import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../utils/constans/color/constans_colors.dart';
import '../../../../utils/constans/style/constans_styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print("Log =====>");
        },
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: ConstansColor.yellow),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  Icon(
                    Icons.search_outlined,
                    color: ConstansColor.grey,
                    size: 23,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Search Product . . .',
                    style: ConstansStyle.grey25,
                  ),
                ],
              ),
              Container(
                child: Text(
                  'Search'.toUpperCase(),
                  style: ConstansStyle.grey20,
                  textAlign: TextAlign.center,
                ),
                width: 150,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ConstansColor.yellow),
              )
            ],
          ),
        ),
      ),
    );
  }
}
