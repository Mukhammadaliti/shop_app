import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/app/presentation/pages/welcom_page/welcom_page_deliveryman/welcom_widget_deliveryman/onBoard_content.dart';

class WelcomPageDeliveryman extends StatelessWidget {
  const WelcomPageDeliveryman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset(
            "images/inapp/2.jpg",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ]),
      ),
    );
  }
}
