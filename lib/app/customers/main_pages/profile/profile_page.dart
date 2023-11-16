import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/customers/main_pages/profile/alert_dialog/alert_dialog.dart';

import 'profile_widgets/profile_header_label_widget.dart';
import 'profile_widgets/repeated_listtile_widget.dart';
import 'profile_widgets/yellow_divider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');

  @override
  Widget build(BuildContext context) {
    // final mediaSizeWidth = MediaQuery.of(context).size.width;
    final mediaSizeHeight = MediaQuery.of(context).size.height;
    return FutureBuilder<DocumentSnapshot>(
      future: customers
          .doc(
            FirebaseAuth.instance.currentUser!.uid,
          )
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            backgroundColor: AppColors.greyShade300,
            body: Stack(children: [
              Container(
                height: 230,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.yellow,
                      AppColors.brown,
                    ],
                  ),
                ),
              ),
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    centerTitle: true,
                    backgroundColor: AppColors.white,
                    expandedHeight: 140,
                    pinned: true,
                    flexibleSpace:
                        LayoutBuilder(builder: (context, ogronichenie) {
                      return FlexibleSpaceBar(
                        title: AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: ogronichenie.biggest.height <= 120 ? 1 : 0,
                          child: Text(
                            'Account',
                            style: TextStyle(color: AppColors.black),
                          ),
                        ),
                        background: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.yellow,
                                AppColors.brown,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Row(
                              children: [
                                data['profileImage'] == ''
                                    ? CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage(
                                            'assets/images/inapp/guest.jpg'),
                                      )
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            NetworkImage(data['profileImage']),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Text(
                                    // 'Guest'.toUpperCase(),
                                    data['name'] == ''
                                        ? 'Guest'.toUpperCase()
                                        : data['name'].toUpperCase(),

                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.black54,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                    ),
                                  ),
                                  child: GestureDetector(
                                      child: SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: Center(
                                          child: Text(
                                            'Cart',
                                            style: TextStyle(
                                              color: AppColors.yellow,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {}),
                                ),
                                Container(
                                  color: AppColors.yellow,
                                  child: GestureDetector(
                                      child: SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: Center(
                                          child: Text(
                                            'Orders',
                                            style: TextStyle(
                                              color: AppColors.black54,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {}),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.black54,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: GestureDetector(
                                      child: SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: Center(
                                          child: Text(
                                            'Wishlist',
                                            style: TextStyle(
                                              color: AppColors.yellow,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {}),
                                ),
                              ]),
                        ),
                        Container(
                          color: AppColors.greyShade300,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/inapp/logotip.png'),
                                ),
                              ),
                              ProfileHeaderLabel(
                                  headerLabel: ' Account Info. '),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  height: mediaSizeHeight * 0.32,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      RepeatedListTile(
                                        title: 'Email Address',
                                        // subTitle: 'example@email.com',
                                        subTitle: data['email'] == ''
                                            ? 'Anonimous email'
                                            : data['email'],
                                        icon: Icons.email,
                                        // onPressed: () {},
                                      ),
                                      YellowDivider(),
                                      RepeatedListTile(
                                        title: 'Phone No.',
                                        // subTitle: 'Anonymous phone',
                                        subTitle: data['phone'] == ' '
                                            ? 'Anonum phone'
                                            : data['phone'],
                                        icon: Icons.phone,
                                      ),
                                      YellowDivider(),
                                      RepeatedListTile(
                                        title: 'Address',
                                        // subTitle: 'Anonymous address ',
                                        subTitle: data['address'] == ' '
                                            ? 'Anonum Address'
                                            : data['address'],
                                        icon: Icons.location_pin,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ProfileHeaderLabel(
                                  headerLabel: ' Account Settings '),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  height: mediaSizeHeight * 0.32,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      RepeatedListTile(
                                        title: 'EditProfile',
                                        // dfgrehtrjt
                                        // subTitle: '',
                                        icon: Icons.edit,
                                        onPressed: () {},
                                      ),
                                      YellowDivider(),
                                      RepeatedListTile(
                                        title: 'Change Password',
                                        icon: Icons.lock,
                                        onPressed: () {},
                                      ),
                                      YellowDivider(),
                                      RepeatedListTile(
                                          title: 'Log Out',
                                          icon: Icons.logout,
                                          onPressed: () {
                                            AlertDialogLogOut.showAlertDialog(
                                                context);
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          );
        }

        return Text("loading");
      },
    );
  }
}
