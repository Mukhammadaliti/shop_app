import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/welcome_page/welcome_widgets/log_sign_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late String email;
  late String password;
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
              SizedBox(
                height: 120,
                child: Image(
                  image: AssetImage('assets/images/inapp/logotip.png'),
                ),
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
                          color: AppColors.grey.withOpacity(0.7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Suppliers only',
                            style: TextStyle(
                                color: AppColors.yellow,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                          color: AppColors.grey.withOpacity(0.7),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 45,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/inapp/kurirr.png'),
                                  ),
                                ),
                                LogSignWidget(
                                    title: 'Log In',
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/suppliers_login');
                                    }),
                                LogSignWidget(
                                    title: 'Sign Up',
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/suppliers_signup');
                                    }),
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: AppColors.grey),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Cutomers',
                            style: TextStyle(
                                color: AppColors.yellow,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 86,
                          bottom: 100,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: AppColors.grey.withOpacity(0.7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                LogSignWidget(
                                  title: 'Sign In',
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/customer_login_page');
                                  },
                                ),
                                LogSignWidget(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/customer_signup_page');
                                  },
                                  title: 'Sing Up ',
                                ),
                                Image.asset(
                                  'assets/images/inapp/users.png',
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
