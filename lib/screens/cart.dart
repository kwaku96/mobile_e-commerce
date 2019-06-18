import 'package:e_commerce_app/common/cart_item.dart';
import 'package:e_commerce_app/common/cart_total_price.dart';
import 'package:e_commerce_app/themes/text_themes.dart';
import 'package:flutter/material.dart';

import 'address_contact_info.dart';


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _fullCart(context),
    );
  }

  Widget _appBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.white,
      textTheme:  appBarTextTheme,
      iconTheme:  appBarIconTheme,
      title: Text(
        'SEPETIM',
      ),
    );
  }

  Widget _emptyCart(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Expanded(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.shopping_basket,
                  size: 280,
                  color: Colors.black.withAlpha(50),
                ),
                Text(
                    'Septinizde urun bulunmamaktadir',
                  style: TextStyle(color: Colors.black.withAlpha(150)),
                )
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15.0,bottom: 30.0),
          child: RaisedButton(
            elevation: 10.0,
            onPressed: (){},
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Alisverise Devam Et',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _fullCart(BuildContext context){
    return Column(
      children: <Widget>[

        Expanded(
          child: Container(
            child: ListView(
              children: <Widget>[

                CartItem(imagePath: 'http://tiny.cc/f2iw6y',),

                CartTotalPrice()
              ],
            ),
          ),
        ),


        Padding(
          padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 10.0),
          child: RaisedButton(
            padding: EdgeInsets.all(10.0),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>AddressContactPage())
              );
            },
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Siparis Tamamla',
                  style: TextStyle(color: Colors.white,fontSize: 18.0),
                ),
                Text(
                  '259,93 TL',
                  style: TextStyle(color: Colors.white,fontSize: 18.0),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
