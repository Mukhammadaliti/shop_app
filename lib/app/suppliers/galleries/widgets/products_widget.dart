// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../detail_gallery/detail_gallery_page.dart';

class ProductModelWidget extends StatelessWidget {
  const ProductModelWidget({super.key, required this.product});
  final dynamic product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              productList: product,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              color: Colors.white,
              height: 250,
              width: 200,
              child: Image.network(
                product['productImages'][0],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            product['productDescription'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                product['price'].toString() + ('\$ '),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.red,
                  size: 25,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
