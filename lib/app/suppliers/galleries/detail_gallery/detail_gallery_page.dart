import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:shop_app/app/suppliers/galleries/detail_gallery/full_page.dart';
import 'package:shop_app/app/suppliers/galleries/widgets/products_widget.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key? key, required this.productList}) : super(key: key);
  final dynamic productList;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late List<dynamic> imagesList = widget.productList['productImages'];

  bool isChoosen = false;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance
        .collection('products')
        .where('maincategoryValue',
            isEqualTo: widget.productList['maincategoryValue'])
        .snapshots();
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.limeAccent,
              automaticallyImplyLeading: false,
              leading: Icon(
                Icons.arrow_back_ios_new,
                size: 30,
              ),
              actions: [
                Row(
                  children: [
                    Icon(
                      Icons.share,
                      size: 30,
                    ),
                  ],
                )
              ]),
          body: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullPage(
                                  imagesList:
                                      widget.productList['productImages'],
                                )));
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: Swiper(
                      pagination:
                          SwiperPagination(builder: SwiperPagination.dots),
                      // autoplay: true,
                      itemCount: imagesList.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          imagesList[index],
                          // fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                Text(
                  widget.productList['productName'],
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'USD ${widget.productList['price']}',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            isChoosen = !isChoosen;
                            setState(() {});
                          },
                          child: isChoosen == true
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 30,
                                ))
                    ],
                  ),
                ),
                Text(
                  widget.productList['quantity'].toString(),
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ProDetailsHeader(label: 'Item Description'),
                Text(
                  widget.productList['productDescription'],
                  style: TextStyle(
                    color: Colors.blueGrey.shade800,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ProDetailsHeader(label: 'Similer Items'),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _productStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
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
                            staggeredTileBuilder: (context) =>
                                StaggeredTile.fit(1)),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProDetailsHeader extends StatelessWidget {
  final String label;
  const ProDetailsHeader({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: Colors.yellow.shade900,
            ),
          ),
          Text(
            '    $label    ',
            style: TextStyle(
              color: Colors.yellow.shade900,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: Colors.yellow.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
