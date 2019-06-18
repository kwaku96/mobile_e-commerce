import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/themes/text_themes.dart';
import '../model/product_model.dart';
import 'package:e_commerce_app/common/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../product_repository.dart';
import '../product_bloc/p_bloc.dart';

class ProductsListScreen extends StatefulWidget {

  final String category;
  final String title;

  ProductsListScreen({this.category='',this.title='Products'});

  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {

  ProductRepository _productRepository;
  ProductBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _productRepository = ProductRepository();
    _productBloc = ProductBloc(productRepository: _productRepository);
    if(widget.category.isEmpty)
      _productBloc.dispatch(FetchAll());
    else
      _productBloc.dispatch(CategoryFetch(category: widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _productBloc,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.white,
      textTheme: appBarTextTheme,
      iconTheme: appBarIconTheme,
      title: Text('${widget.title}'),
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: (){},
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context){
    return BlocListener(
      bloc: _productBloc,
      listener: (BuildContext context,ProductFetchingState state){
        if(state is Error){
          Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Error while loading products'),
                backgroundColor: Colors.redAccent,
              ));
        }

        if(state is Uninitialized){
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text('Fetching products'),
              backgroundColor: Colors.black.withAlpha(200),
              duration: Duration(milliseconds: 250),
            ));
        }
      },

      child: BlocBuilder(
        bloc: _productBloc,
        builder: (BuildContext context,ProductFetchingState state){

          if(state is Fetched){
            return StreamBuilder(
              stream: state.snapshot,
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.68,

                  ),
                  itemCount: snapshot.hasData ?
                    snapshot.data.documents.length : 0,
                  itemBuilder: (context,index){

                    ProductModel pm = ProductModel
                        .fromSnapShot(snapshot.data.documents[index]);
                    return Product(
                      title: pm.title,
                      price: pm.price,
                      imagePath: pm.imagePath,
                      onTap: (){

                      },
                    );
                  },

                );
              },

            );
          }

          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );

        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _productBloc.dispose();
  }

}
