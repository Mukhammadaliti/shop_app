import 'package:flutter/material.dart';
import 'package:shop_app/app/categories/accessories/accessories_category.dart';
import 'package:shop_app/app/categories/bags/bags_category.dart';
import 'package:shop_app/app/categories/beauty/beauty_category.dart';
import 'package:shop_app/app/categories/electronics/electronics_category.dart';
import 'package:shop_app/app/categories/homeGarden/home_garden.dart';
import 'package:shop_app/app/categories/kids/kids_category.dart';
import 'package:shop_app/app/categories/men/men_category.dart';
import 'package:shop_app/app/categories/shoes/shoes_category.dart';
import 'package:shop_app/app/categories/women/women_category.dart';
import 'package:shop_app/app/widgets/app_bar/search_widget.dart';
import 'package:shop_app/app/widgets/tab_bar_widgets/repeated_tab_bar_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
          MenCategory(),
          WomenCategory(),
          AccessoriesCategory(),
          ShoesCategory(),
          BagsCategory(),
          KidsCategory(),
          HomeGardanCategory(),
          ElectronicsCategory(),
          BeautyCategory(),
        ]),
      ),
    );
  }
}
