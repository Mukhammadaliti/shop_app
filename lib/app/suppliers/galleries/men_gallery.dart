import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenGallery extends StatefulWidget {
  const MenGallery({Key? key}) : super(key: key);

  @override
  _MenGalleryState createState() => _MenGalleryState();
}

class _MenGalleryState extends State<MenGallery> {
  final Stream<QuerySnapshot> _productStream =
      FirebaseFirestore.instance.collection('products').snapshots();
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

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 350,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 30,
                ),
                itemBuilder: (context, index) => Column(children: [
                  Container(
                    color: Colors.white,
                    height: 250,
                    width: 200,
                    child: Image.network(data['productImages'][index][0]),
                  ),
                  Text(
                    '200 som',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
