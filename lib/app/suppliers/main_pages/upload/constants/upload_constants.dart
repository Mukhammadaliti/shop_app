import 'package:flutter/material.dart';

var inputDecoration = InputDecoration(
  labelText: 'price',
  hintText: 'price .. \$',
  labelStyle: TextStyle(color: Colors.purple),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.yellow,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueAccent,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10)),
);
