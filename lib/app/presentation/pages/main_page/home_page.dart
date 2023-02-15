import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app/app/presentation/pages/main_page/category_page.dart';
import 'package:shop_app/app/presentation/pages/main_page/profil_page.dart';
import 'package:shop_app/app/utils/constans/color/constans_colors.dart';
import 'package:shop_app/app/utils/constans/style/constans_styles.dart';

import '../widget/screen_body_text/screen_widget.dart';
import '../widget/searc_widget/search_widget.dart';
import '../widget/tab_bar_widget/repeared_tab_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _tab = [
    const ScreenWidget(textscreen: 'Home Screen'),
    const ScreenWidget(textscreen: 'Category Screen'),
    const ScreenWidget(textscreen: 'History Screen'),
    const ScreenWidget(textscreen: 'Profil Screen'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        body: _tab[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: ConstansColor.amber,
          onTap: (index) {
            _selectedIndex = index;
            setState(() {});
          },
          selectedItemColor: ConstansColor.black87,
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home_outlined),
                tooltip: "Home"),
            BottomNavigationBarItem(
              tooltip: "Category",
              label: "Category",
              icon: Icon(Icons.window),
            ),
            BottomNavigationBarItem(
              tooltip: "Shopping History",
              label: "Shopping History",
              icon: Icon(Icons.shopping_bag_outlined),
            ),
            BottomNavigationBarItem(
              tooltip: 'Profil',
              label: "Profil",
              icon: IconButton(
                icon: Icon(Icons.person_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: SearchWidget(),
          elevation: 0,
          backgroundColor: ConstansColor.transparent,
          bottom: TabBar(
              isScrollable: true,
              indicatorWeight: 5,
              indicatorColor: ConstansColor.yellow,
              tabs: [
                RepeatedTabWidget(
                  name: 'Men',
                ),
                RepeatedTabWidget(
                  name: 'Women',
                ),
                RepeatedTabWidget(
                  name: 'kids',
                ),
                RepeatedTabWidget(
                  name: 'Shose',
                ),
                RepeatedTabWidget(
                  name: 'Bags',
                ),
                RepeatedTabWidget(
                  name: 'Bags',
                ),
                RepeatedTabWidget(
                  name: 'Bags',
                ),
              ]),
        ),
      ),
    );
  }
}
