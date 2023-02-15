import 'package:flutter/material.dart';
import 'package:shop_app/app/presentation/pages/main_page/home_page.dart';
import 'package:shop_app/app/presentation/pages/register_page/register_page.dart';
import 'package:shop_app/app/presentation/pages/welcom_page/welcom_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/presentation/pages/welcom_page/welcom_page_deliveryman/welcom_page_deliveryman.dart';

// import 'app/presentation/pages/welcom_page/welcom_page_deliveryman/welcom_page_deliveryman.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // home: WelcomPageDeliveryman(),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/singup_page': (context) => RegisterPage(),
        '/home_page': (context) => HomePage(),
      },
      // home: WelcomePage(),
    );
  }
}
