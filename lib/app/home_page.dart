import 'package:flutter/material.dart';
import 'package:shop_app/app/suppliers/galleries/accessories_gallery.dart';
import 'package:shop_app/app/suppliers/galleries/bags_gallery.dart';
import 'package:shop_app/app/suppliers/galleries/beauty_gallery.dart';
import 'package:shop_app/app/suppliers/galleries/home_garden_gallery.dart';
import 'package:shop_app/app/suppliers/galleries/kids_gallery.dart';
import 'package:shop_app/app/suppliers/galleries/men_gallery.dart';
import 'package:shop_app/app/suppliers/galleries/shoes_gallery.dart';
import 'package:shop_app/app/suppliers/galleries/women_gallery.dart';
import 'package:shop_app/app/widgets/app_bar/search_widget.dart';
import 'package:shop_app/app/suppliers/galleries/electronis_gallery.dart';
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
          WomenGallery(),
          AccessoriesGallery(),
          ShoesGallery(),
          BagsGallery(),
          KidsGallery(),
          HomeGardenGallery(),
          ElectronicsGallery(),
          BeautyGallery(),
        ]),
      ),
    );
  }
}
