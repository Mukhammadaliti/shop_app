import 'package:flutter/material.dart';

class FullPage extends StatelessWidget {
  const FullPage({super.key, required this.imagesList});
  final List<dynamic> imagesList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Column(children: [
        Text(
          '1/5',
          style: TextStyle(fontSize: 24, letterSpacing: 8),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: PageView(
            children: List.generate(imagesList.length, (index) {
              return InteractiveViewer(
                transformationController: TransformationController(),
                child: Image.network(
                  imagesList[index].toString(),
                ),
              );
            }),
          ),
        )
      ]),
    );
  }
}
