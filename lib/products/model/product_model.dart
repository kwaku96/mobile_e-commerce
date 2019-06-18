import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{

  final String title;
  final double price;
  final String imagePath;
  final String category;

  ProductModel({
    @required this.category,
    @required this.title,
    @required this.imagePath,
    @required this.price
  });

  factory ProductModel.fromSnapShot(DocumentSnapshot snapShot){
    return ProductModel(
      title: snapShot['title'],
      price: snapShot['price'],
      imagePath: snapShot['imagePath'],
      category: snapShot['category']
    );
  }

}