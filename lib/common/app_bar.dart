import 'package:e_commerce_app/screens/cart.dart';
import 'package:e_commerce_app/screens/favorites.dart';
import 'package:e_commerce_app/themes/text_themes.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {

  final String title;

  MyAppBar({this.title=''});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      textTheme: appBarTextTheme,
      iconTheme: appBarIconTheme,
      title: Text(
        title,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder:(context)=>FavoritesPage())
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){
            //TODO open search page
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>CartPage())
            );
          },
        ),
      ],
    );
  }
}