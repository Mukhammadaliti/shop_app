import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:shop_app/app/suppliers/galleries/widgets/product_model_widget.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'widgets/products_widget.dart';

class AccessoriesGallery extends StatefulWidget {
  const AccessoriesGallery({Key? key}) : super(key: key);

  @override
  _AccessoriesGalleryState createState() => _AccessoriesGalleryState();
}

class _AccessoriesGalleryState extends State<AccessoriesGallery> {
  final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance
      .collection('products')
      .where('maincategoryValue', isEqualTo: 'accessories')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _productStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              'This category \n\n has no items yet  !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontFamily: 'Acme',
                letterSpacing: 1.5,
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: StaggeredGridView.countBuilder(
              itemCount: snapshot.data!.docs.length,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return ProductModelWidget(
                  product: snapshot.data!.docs[index],
                );
              },
              staggeredTileBuilder: (context) => StaggeredTile.fit(1)),
        );
      },
    );
  }
}
