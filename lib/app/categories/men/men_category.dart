import 'package:flutter/material.dart';
import 'package:shop_app/app/categories/sub_category_page/sub_category_page.dart';
import 'package:shop_app/app/utilities/categ_list.dart';

class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

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
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.count(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: List.generate(men.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubCategegoryPage(
                                subCategName: men[index],
                                mainCategName: 'men',
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
                                    'assets/images/men/men$index.jpg'),
                                // image: AssetImage(assetName),
                              ),
                            ),
                            Text(men[index]),
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
