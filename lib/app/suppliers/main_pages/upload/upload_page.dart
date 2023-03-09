import 'dart:developer';
// import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/app/auth_widgets/snack_bar_widget.dart';
import 'package:shop_app/app/suppliers/main_pages/upload/constants/upload_constants.dart';
import 'package:shop_app/app/utilities/categ_list.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String mainCategValue = 'select category';
  String subCategValue = 'subcategory';
  int? price;
  int? quantity;
  String? productName;
  String? productDescription;

  List<String> subCategList = [];
  final ImagePicker _picker = ImagePicker();

  XFile? _imageFile;
  List<XFile> imagesFileList = [];
  List<String> imagesUrlList = [];
  dynamic _pickedImageError;
  bool processing = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  Future<void> uploadImages() async {
    if (mainCategValue != 'select category' || subCategValue != 'subcategory') {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (imagesFileList.isNotEmpty) {
          setState(() {
            processing = true;
          });
          try {
            for (var image in imagesFileList) {
              Reference ref = FirebaseStorage.instance
                  .ref('products/${path.basename(image.path)}');
              await ref.putFile(File(image.path)).whenComplete(() async {
                await ref.getDownloadURL().then((value) {
                  imagesUrlList.add(value);
                });
              });
            }
          } catch (e) {
            log('$e');
          }
        } else {
          SnackBarWidget.snackBar(
            'Please pick images first!',
            _scaffoldKey,
          );
        }
      } else {
        SnackBarWidget.snackBar(
          'please fill all fields',
          _scaffoldKey,
        );
      }
    } else {
      SnackBarWidget.snackBar(
        'please Select Categories',
        _scaffoldKey,
      );
    }
  }

  void uploadData() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    var uid = Uuid().v4();
    await products.doc(uid).set({
      'maincategoryValue': mainCategValue,
      'subcategoryValue': subCategValue,
      'price': price,
      'quantity': quantity,
      'productName': productName,
      'productDescription': productDescription,
      'productImages': imagesUrlList,
      'sId': FirebaseAuth.instance.currentUser!.uid,
      'discount': 0,
    });
  }

  void uploadProduct() async {
    await uploadImages().whenComplete(() => uploadData());
    imagesFileList = [];
    mainCategValue = 'select category';

    subCategValue = 'subcategory';
    _formKey.currentState!.reset();
    setState(() {
      processing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: size.height * 0.30,
                        width: size.width * 0.5,
                        color: Colors.grey.shade600,
                        child: coverImages(),
                      ),
                      Column(
                        children: [
                          Text(
                            '* select main category',
                            style: TextStyle(color: Colors.red),
                          ),
                          DropdownButton(
                            iconSize: 40,
                            iconEnabledColor: Colors.red,
                            dropdownColor: Colors.yellow.shade400,
                            value: mainCategValue,
                            items: maincateg
                                .map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              selectedMainCateg(value);
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          Text(
                            '* select subcategory',
                            style: TextStyle(color: Colors.red),
                          ),
                          DropdownButton(
                            iconSize: 40,
                            iconEnabledColor: Colors.red,
                            iconDisabledColor: Colors.black,
                            dropdownColor: Colors.yellow.shade400,
                            disabledHint: Text('select category'),
                            value: subCategValue,
                            items: subCategList
                                .map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {});
                              subCategValue = value!;
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.yellow,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width * 0.5,
                      child: TextFormField(
                        validator: (value) {},
                        onSaved: (value) {
                          price = int.parse(value!);
                        },
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: inputDecoration.copyWith(
                          labelText: 'price',
                          hintText: 'price .. \$',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: TextFormField(
                        validator: (value) {},
                        onSaved: (value) {
                          quantity = int.parse(value!);
                        },
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: inputDecoration.copyWith(
                          labelText: 'quantity',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLength: 100,
                      maxLines: 3,
                      validator: (value) {},
                      onSaved: (value) {
                        productName = value!;
                      },
                      decoration: inputDecoration.copyWith(
                        labelText: 'product name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLength: 800,
                      maxLines: 5,
                      validator: (value) {},
                      onSaved: (value) {
                        productDescription = value!;
                      },
                      decoration: inputDecoration.copyWith(
                        labelText: 'product description',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.yellow,
                onPressed: pickMultipleImages,
                child: Icon(
                  Icons.photo_library,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                backgroundColor: Colors.yellow,
                onPressed: uploadProduct,
                child: processing == true
                    ? CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.upload,
                        color: Colors.black,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* Widget coverImages() {
    if (imagesFileList.isNotEmpty) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: imagesFileList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.amber,
                child: Center(
                  child: Image.file(
                    File(imagesFileList[index].path),
                  ),
                ),
              ),
            );
          });
    } else {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemCount: 30,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  pickMultipleImages();
                },
                child: Container(
                  color: Colors.amber,
                  child: Center(child: Icon(Icons.photo)
                      //      Image.file(
                      //   File(imagesFileList[index].path),
                      // ),
                      ),
                ),
              ),
            );
          });

      // Center(
      //   child: Text(
      //     ' you have not \n \n picked images yet !',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       fontSize: 16,
      //     ),
      //   ),
      // );
    }
  }

  */

  Widget coverImages() {
    if (imagesFileList.isNotEmpty) {
      return ListView.builder(
          itemCount: imagesFileList.length,
          itemBuilder: (context, index) {
            return Image.file(
              File(imagesFileList[index].path),
            );
          });
    } else {
      return Center(
        child: Text(
          ' you have not \n \n picked images yet !',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
    }
  }

  void pickMultipleImages() async {
    try {
      final _pickedImage = await _picker.pickMultiImage(
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );

      setState(() {
        imagesFileList = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });

      log('image error $_pickedImageError');
    }
  }

  void selectedMainCateg(String? value) {
    if (value == 'select category') {
      subCategList = [];
    } else if (value == 'men') {
      subCategList = men;
    } else if (value == 'women') {
      subCategList = women;
    } else if (value == 'electronics') {
      subCategList = electronics;
    } else if (value == 'accessories') {
      subCategList = accessories;
    } else if (value == 'shoes') {
      subCategList = shoes;
    } else if (value == 'home & garden') {
      subCategList = homeandgarden;
    } else if (value == 'beauty') {
      subCategList = beauty;
    } else if (value == 'kids') {
      subCategList = kids;
    } else if (value == 'bags') {
      subCategList = bags;
    }
    setState(() {
      mainCategValue = value!;
      subCategValue = 'subcategory';
    });
  }
}
