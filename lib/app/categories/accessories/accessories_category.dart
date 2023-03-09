import 'package:flutter/material.dart';
import 'package:shop_app/app/categories/sub_category_page/sub_category_page.dart';
import 'package:shop_app/app/utilities/categ_list.dart';

class AccessoriesCategory extends StatelessWidget {
  const AccessoriesCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.99,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.count(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: List.generate(accessories.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubCategegoryPage(
                                subCategName: accessories[index],
                                mainCategName: 'accessories',
                              ),
                              // subCategName: subCategName,
                              // mainCategName: mainCategName),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 150,
                              width: 500,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/accessories/accessories$index.jpg'),
                                // image: AssetImage(assetName),
                              ),
                            ),
                            Text(accessories[index]),
                            // Text(subCategLabel),
                          ],
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
