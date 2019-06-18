import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _emptyList(context),
    );
  }

  Widget _appBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.green),
      textTheme: TextTheme(
        title: TextStyle(color: Colors.green)
      ),
      title: Text('FAVORILERIM'),
      actions: <Widget>[
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

  Widget _emptyList(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:18.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.favorite_border,size: 50.0,color: Colors.black.withAlpha(100),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'Henuz Favori Urununuz Yok',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:10.0,top: 10.0),
            child: Text(
              'Favorilerinize henuz urun eklemediniz,tek yapmaniz gereken\n'
                  'urun gorsellerinin uzerindeki kucuk kalp ikonuna tiklamak',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          RaisedButton(
            color: Colors.green,
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Alisveris Basla',
                  style: TextStyle(color: Colors.white,fontSize: 18.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
