import 'package:flutter/material.dart';
import 'package:shop_app/app/categories/sub_category_page/sub_category_page.dart';
import 'package:shop_app/app/utilities/categ_list.dart';

class KidsCategory extends StatelessWidget {
  const KidsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.67,
                    child: GridView.count(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      crossAxisCount: 2,
                      children: List.generate(kids.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubCategegoryPage(
                                  subCategName: kids[index],
                                  mainCategName: 'kids',
                                ),
                                // subCategName: subCategName,
                                // mainCategName: mainCategName),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                // color: Colors.blue,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/kids/kids$index.jpg'),
                                  // image: AssetImage(assetName),
                                ),
                              ),
                              Text(kids[index]),
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
          ),
        ],
      ),
    );
  }
}
