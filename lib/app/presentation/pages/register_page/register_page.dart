// import 'dart:math';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/app/presentation/pages/main_page/home_page.dart';
import 'package:shop_app/app/presentation/pages/register_page/register_widget/camera_choice_widget.dart';
import 'package:shop_app/app/utils/constans/color/constans_colors.dart';
import 'package:shop_app/app/utils/constans/style/constans_styles.dart';

TextEditingController _nameController = TextEditingController();

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffolfKey =
      GlobalKey<ScaffoldMessengerState>();
  String? _name;
  String? _email;
  String? _password;
  bool isVisible = true;
  bool processing = false;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  dynamic _pickImageError;
  void _pickedImageCamera() async {
    try {
      final _pickedImage = await _picker.pickImage(
          source: ImageSource.camera,
          maxHeight: 300,
          maxWidth: 300,
          imageQuality: 95);
      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      log('image error $_pickImageError');
    }
  }

  void _pickedImageFromGalery() async {
    try {
      final _pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      log('image error $_pickImageError');
    }
  }

  void snackBar(String text) {
    _scaffolfKey.currentState!.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 4),
        backgroundColor: ConstansColor.purple,
          content: Text(
        text,
        textAlign: TextAlign.center,
        style: ConstansStyle.black25,
      )),
    );
  }

  void singUp() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      if (_imageFile != null) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _email!, password: _password!);
          Navigator.pushReplacementNamed(context, '/home_page');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            setState(() {
              processing = false;
            });
            snackBar('The password provided is too weak.');
            log('The password provided is too weak.');
          } else if (e.code == 'email  - already - in - user') {
            setState(() {
              processing = false;
            });
            snackBar('The account already exists for that email.');
            log('The account already exists for that email.');
          }
        } catch (e) {
          setState(() {
            processing = false;
          });
          snackBar('$e');
          log('$e');
        }
      } else {
        setState(() {
          _imageFile = null;
        });
        snackBar('Please pick an image');
      }
    } else {
      setState(() {
        processing = false;
      });
      snackBar('Please fill your blank');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffolfKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Sing Up',
                        style: ConstansStyle.black25bold,
                      ),
                      // SizedBox(),
                      Icon(Icons.maps_home_work)
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundColor: ConstansColor.purple,
                            backgroundImage: _imageFile == null
                                ? null
                                : FileImage(File(_imageFile!.path)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CameraChoiceWidget(
                                  radiusOnly: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16)),
                                  icon: Icons.camera_alt,
                                  onpress: () {
                                    log('message');
                                    _pickedImageCamera();
                                  },
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CameraChoiceWidget(
                                  radiusOnly: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                  icon: Icons.photo,
                                  onpress: () {
                                    _pickedImageCamera();
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            _name = value;
                            log(_name!);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please fiil yuor full Name';
                            } else {}
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2.0),
                            ),
                            hintText: 'Please enter your full name ',
                            label: Text(
                              'Full name',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blueGrey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _email = value;
                            log(_email!);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please fill your email';
                            } else if (value.isValideEmail() == false) {
                              return null;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: ConstansColor.blue, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: ConstansColor.purple, width: 2.0),
                            ),
                            hintText: 'Please enter your email  ',
                            label:
                                Text('Email', style: ConstansStyle.blueGrey25),
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
                                  color: ConstansColor.blue, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: ConstansColor.purple, width: 2.0),
                            ),
                            hintText: 'Please enter your password ',
                            label: Text('Password',
                                style: ConstansStyle.blueGrey25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('already have account?  ',
                          style: ConstansStyle.black18),
                      GestureDetector(
                        onTap: () {},
                        child:
                            Text('Log In    ', style: ConstansStyle.purple20blod),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  processing == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ConstansColor.purple,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            singUp();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ConstansColor.purple,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 150,
                                vertical: 15,
                              ),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
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
  bool isValideEmail() {
    return RegExp(r'^([a-zA-Z0-9]+)([@])([a-zA-Z0-9]+)([\-\_\.])([a-z]{2,3})$')
        .hasMatch(this);
  }
}
