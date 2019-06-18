import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductFetchingState extends Equatable {
  ProductFetchingState([List props = const []]):super(props);
}


class Uninitialized extends ProductFetchingState {
  @override
  String toString() => "uninitialized";
}

class Fetched extends ProductFetchingState{

  final Stream<QuerySnapshot> snapshot;

  Fetched({@required this.snapshot}):super([snapshot]);

  @override
  String toString() => "fetching";
}

class Error extends ProductFetchingState{
  @override
  String toString() => "error";
}


class AddToCartState extends ProductFetchingState{
  @override
  String toString() => "Add to cart state";
}