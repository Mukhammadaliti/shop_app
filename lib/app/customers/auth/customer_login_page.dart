import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/auth_widgets/have_account_widget.dart';
import 'package:shop_app/app/auth_widgets/snack_bar_widget.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

class CustomerLogInPage extends StatefulWidget {
  const CustomerLogInPage({Key? key}) : super(key: key);

  @override
  _CustomerLogInPageState createState() => _CustomerLogInPageState();
}

class _CustomerLogInPageState extends State<CustomerLogInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  String? _email;
  String? _password;
  bool isVisible = true;
  bool processing = false;

  void logIn() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email!,
          password: _password!,
        );
        Navigator.pushReplacementNamed(context, '/customer_page');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            processing = false;
          });
          SnackBarWidget.snackBar(
              'No user found for that email.', _scaffoldKey);
        } else if (e.code == 'wrong-password') {
          SnackBarWidget.snackBar(
              'Wrong password provided for that user.', _scaffoldKey);

          setState(() {
            processing = false;
          });
        }
      }
    } else {
      setState(() {
        processing = false;
      });
      SnackBarWidget.snackBar('Please fill your blank', _scaffoldKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/welcome_page');
                          },
                          icon: Icon(
                            Icons.home_work,
                            size: 35,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 100),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            _email = value;
                            log(_email!);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please fill your email';
                            } else if (value.isValidEmail() == false) {
                              return 'Not Valid';
                            } else if (value.isValidEmail() == true) {
                              return null;
                            }
                            return null;
                          },
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: AppColors.blue, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: AppColors.yellow, width: 2.0),
                            ),
                            hintText: 'Please enter your email  ',
                            label: Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.blueGrey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _password = value;
                            log(_password!);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please fill your password';
                            } else {
                              return null;
                            }
                          },
                          obscureText: isVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(isVisible == true
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: AppColors.yellow, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: AppColors.yellow, width: 2.0),
                            ),
                            hintText: 'Please enter your password ',
                            label: Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.blueGrey),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password? ',
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        HaveAccountWidget(
                            haveAccount: 'Don\t have account?  ',
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/customer_signup_page');
                            },
                            registerTitle: 'Sign Up')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  processing == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.yellowShade700,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            logIn();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.yellowShade700,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 150,
                                vertical: 15,
                              ),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^([a-zA-Z0-9]+)([@])([a-zA-Z0-9]+)([\-\_\.])([a-z]{2,3})$')
        .hasMatch(this);
  }
}
