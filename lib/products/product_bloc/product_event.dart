import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ProductFetchingEvent extends Equatable {
  ProductFetchingEvent([List props = const []]):super(props);
}

class FetchAll extends ProductFetchingEvent {
  @override
  String toString() => "fetch all";
}

class CategoryFetch extends ProductFetchingEvent {
  final String category;
  
  CategoryFetch({@required this.category}):super([category]);
  
  @override
  String toString() => "fetch a category";
}

class AddToCartButtonPressed extends ProductFetchingEvent{
  final String documentReference;

  AddToCartButtonPressed({@required this.documentReference}):
      assert(documentReference != null),
      super([documentReference]);

  @override
  String toString() => "Add to cart button pressed";
}