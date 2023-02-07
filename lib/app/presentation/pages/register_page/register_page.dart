import 'package:flutter/material.dart';
import 'package:shop_app/app/utils/constans/color/constans_colors.dart';
import 'package:shop_app/app/utils/constans/style/constans_styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, }) : super(key: key);

  
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // final GlobalKey<F>
   String? _name;
   String? _email;
  //  String? _name;
  //  String? _name;
   String? _password;
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      // key: _scafoldKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Form(
              // key: _formKey,
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
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: ConstansColor.pink,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: Icon(Icons.photo),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: ConstansColor.pink,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  child: Icon(Icons.camera_alt_outlined))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      _name = value;
                    },
                    decoration: InputDecoration(
                        hintText: 'Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Full Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(20),
                        )),
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
