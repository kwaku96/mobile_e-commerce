import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseFunctions {
  final Firestore _firestore;
  final FirebaseAuth _firebaseAuth;

   static const String ORDER_ITEM = "orderItems";
   static const String ORDER = 'order';

  FirebaseFunctions({Firestore firestore,FirebaseAuth firebaseAuth}):
      _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _firestore = firestore ?? Firestore.instance;

  Future<void> addItemToCart(String documentID) async {
    DocumentReference item = await _getOrCreateOrderItem(documentID);
    _getUserOrders(item);
  }

  Future<String> currentUserId() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  Future<DocumentReference> _getOrCreateOrderItem(String documentId) async {
    String uid = await currentUserId();

    List<DocumentSnapshot> documents = (await  _firestore.collection(ORDER_ITEM)
        .where('productID',isEqualTo: documentId)
        .where('uid',isEqualTo: uid)
        .where('ordered',isEqualTo: false).getDocuments()).documents;

    if(documents.length == 0){
      
      DocumentReference documentReference = await
        _firestore.collection(ORDER_ITEM).add({
        'uid':uid,
        'productID':documentId,
        'ordered':false,
        'quantity':0
      });

      return documentReference;
    }else{
      return documents[0].reference;
    }

  }

  Future _getUserOrders(DocumentReference documentReference) async {
    String uid = await currentUserId();

    List<DocumentSnapshot> documents = (await _firestore.collection(ORDER)
        .where('uid',isEqualTo: uid)
        .where('ordered',isEqualTo: false).getDocuments()).documents;

    if(documents.length == 0){
      _firestore.collection(ORDER).add({
        "uid":uid,
        'ordered':false,
        'items':[
          documentReference
        ]
      });
    }else{
      documents[0]['items'].add(documentReference);
    }
  }

}