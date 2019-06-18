import 'package:cloud_firestore/cloud_firestore.dart';


class ProductRepository {
  final String _dbTable = "products";
  final Firestore _firestore;

  ProductRepository({Firestore firestore}):
      _firestore = firestore ?? Firestore.instance;

  Future<Stream<QuerySnapshot>> fetchAll() async {
    return _firestore.collection(_dbTable).snapshots();
  }

  Future<Stream<QuerySnapshot>> fetchBasedOnCategory(String category) async {
    Query query =  _firestore.collection(_dbTable)
        .where('category',isEqualTo: category);
    return query.snapshots();
  }

  Future<void> addProduct(Map<String,dynamic> product) async{
    _firestore.collection(_dbTable).add(product);
  }

  Future<void> deleteProduct(DocumentReference documentReference) async {
    _firestore.runTransaction((transaction){
      transaction.delete(documentReference);
    },timeout: Duration(seconds: 3));
  }

  Future<void> updateProduct(
      DocumentReference documentReference,Map<String,dynamic> data) async{
    _firestore.runTransaction((transaction){
      transaction.update(documentReference, data);
    });
  }

}