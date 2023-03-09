import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/customers/auth/customer_login_page.dart';
import 'package:shop_app/app/customers/auth/customer_sign_up_page.dart';
import 'package:shop_app/app/customers/main_pages/customer/customer_page.dart';
import 'package:shop_app/app/home_page.dart';
import 'package:shop_app/app/suppliers/auth/suppliers_login.dart';
import 'package:shop_app/app/suppliers/auth/suppliers_signup.dart';
import 'package:shop_app/app/suppliers/main_pages/category/category_page.dart';
import 'package:shop_app/app/suppliers/main_pages/upload/upload_page.dart';

import 'app/suppliers/suppliers_page.dart';
import 'app/welcome_page/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: UploadPage(),
      // home: SuppliersPage(),
      // home: UploadPage(),
      // home: HomePage(),
      initialRoute: '/welcome_page',
      routes: {
        '/welcome_page': (context) => WelcomePage(),
        '/home_page': (context) => HomePage(),
        '/customer_signup_page': (context) => CustomerSignUpPage(),
        '/customer_page': (context) => CustomerPage(),
        '/customer_login_page': (context) => CustomerLogInPage(),
        '/suppliers_page': (context) => SuppliersPage(),
        '/suppliers_signup': (context) => SuppliersSignUp(),
        '/suppliers_login': (context) => SuppliersLogIn(),
      },
    );
  }
}
