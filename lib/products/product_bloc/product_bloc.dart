import 'p_bloc.dart';
import 'package:bloc/bloc.dart';
import '../product_repository.dart';
import 'package:meta/meta.dart';
import '../../general_firebase_functions/firebase_functions.dart';

class ProductBloc extends Bloc<ProductFetchingEvent,ProductFetchingState>{

  final ProductRepository _productRepository;
  final FirebaseFunctions _firebaseFunctions;

  ProductBloc({@required ProductRepository productRepository,
      FirebaseFunctions firebaseFunctions}):
      assert(productRepository != null),
      _productRepository = productRepository,
      _firebaseFunctions = firebaseFunctions ?? FirebaseFunctions();

  @override
  ProductFetchingState get initialState => Uninitialized();

  @override
  Stream<ProductFetchingState>
  mapEventToState(ProductFetchingEvent event) async*{
    if(event is FetchAll){
      yield* _mapFetchAllToState(event);
    }else if(event is CategoryFetch){
      yield* _mapCategoryFieldToState(event);
    }else if(event is AddToCartButtonPressed){
      yield* _mapAddToCartButtonPressedToState(event);
    }
  }

  Stream<ProductFetchingState> _mapFetchAllToState(FetchAll event) async* {

    try{

      if(currentState is Uninitialized){
        final snapshot = await _productRepository.fetchAll();
        yield Fetched(snapshot: snapshot);
      }

    }catch(_){
      yield Error();
    }

  }

  Stream<ProductFetchingState>
  _mapCategoryFieldToState(CategoryFetch event) async* {

    try{

      if(currentState is Uninitialized){
        final snapshot =
          await _productRepository.fetchBasedOnCategory(event.category);
        yield Fetched(snapshot: snapshot);
      }

    }catch(_){
      yield Error();
    }

  }

  Stream<ProductFetchingState>
    _mapAddToCartButtonPressedToState(AddToCartButtonPressed event) async* {

  }

}