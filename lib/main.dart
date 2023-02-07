import 'package:flutter/material.dart';
import 'package:shop_app/app/presentation/pages/main_page/home_page.dart';
import 'package:shop_app/app/presentation/pages/register_page/register_page.dart';
import 'package:shop_app/app/presentation/pages/welcom_page/welcom_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      // initialRoute: '/',
      // routes: {
      //   '/singUp_page' :(context) => RegisterPage(),
      //   '/welcom_page' :(context) => WelcomePage(),
      // },
    );
  }
}
