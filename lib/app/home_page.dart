import 'package:flutter/material.dart';
import 'package:shop_app/app/suppliers/galleries/men_gallery.dart';
import 'package:shop_app/app/widgets/app_bar/search_widget.dart';
import 'package:shop_app/app/widgets/tab_bar_widgets/repeated_tab_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: SearchWidget(),
            bottom: TabBar(
              indicatorColor: Colors.yellow,
              indicatorWeight: 8,
              isScrollable: true,
              tabs: [
                RepeatedTabBarWidget(label: 'Men'),
                RepeatedTabBarWidget(label: 'Women'),
                RepeatedTabBarWidget(label: 'Accessories'),
                RepeatedTabBarWidget(label: 'Shoes'),
                RepeatedTabBarWidget(label: 'Bags'),
                RepeatedTabBarWidget(label: 'Kids'),
                RepeatedTabBarWidget(label: 'Home & Garden'),
                RepeatedTabBarWidget(label: 'Electronics'),
                RepeatedTabBarWidget(label: 'Beauty'),
              ],
            )),
        body: TabBarView(children: [
          MenGallery(),
          Center(child: Text('women screen')),
          Center(child: Text('Accessories screen')),
          Center(child: Text('Shoes screen')),
          Center(child: Text('Bags screen')),
          Center(child: Text('Kids screen')),
          Center(child: Text('home & garden screen')),
          Center(child: Text('Electronics screen')),
          Center(child: Text('beauty screen')),
        ]),
      ),
    );
  }
}
