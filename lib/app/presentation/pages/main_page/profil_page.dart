import 'package:flutter/material.dart';
import 'package:shop_app/app/utils/constans/color/constans_colors.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({ Key? key }) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        color: ConstansColor.amber,
      ),
    );
  }
}