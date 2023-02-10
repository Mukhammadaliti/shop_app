import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/presentation/pages/register_page/register_page.dart';
import 'package:shop_app/app/presentation/pages/welcom_page/welcom_page_wigets/log_sign_widget.dart';
import 'package:shop_app/app/presentation/pages/welcom_page/welcom_page_wigets/quick_registration_widget.dart';
import 'package:shop_app/app/utils/constans/color/constans_colors.dart';

import '../widget/animation_widget/colorize_animation_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/inapp/bg.jpg'),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColorizeAnimationWidget(),
              Image(
                height: 190,
                width: 190,
                image: AssetImage('assets/images/inapp/logotip.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                          color: Colors.grey.withOpacity(0.7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Suppliers only',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 70,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LogSignWidget(
                            write: 'Log In',
                            tap: () {},
                          ),
                          LogSignWidget(
                            tap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                            },
                            write: 'Sing In',
                          ),
                          Image(
                            height: 80,
                            image:
                                AssetImage('assets/images/inapp/logotip.png'),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                color: Colors.grey.withOpacity(0.7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // GoogleFacebookGuestWidget(title: 'Google', icon: Icons.google, onTap: (){}),
                    QuickRegistrationWidget(
                      title: 'Google',
                      pressed: () {},
                      image: Image.asset(
                        'assets/images/inapp/google.jpg',
                        width: 50,
                      ),
                    ),
                    QuickRegistrationWidget(
                      title: 'Facebook',
                      pressed: () {},
                      image: Image.asset(
                        'assets/images/inapp/facebook.jpg',
                        width: 50,
                      ),
                    ),
                    QuickRegistrationWidget(
                      title: 'Guest',
                      pressed: () {},
                      image: Image.asset(
                        'assets/images/inapp/person.png',
                        width: 50,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
