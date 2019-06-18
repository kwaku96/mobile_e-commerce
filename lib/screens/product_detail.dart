import 'package:e_commerce_app/common/app_bar.dart';
import 'package:flutter/material.dart';



class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }


Widget _appBar(BuildContext context){
    return PreferredSize(
      child: MyAppBar(title: 'Product title',),
      preferredSize: Size(double.infinity, 58.0),
    );
  }


  Widget _body(BuildContext context){

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.35,
            width: size.width,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      color:Colors.black.withAlpha(100),
                      height: size.height * 0.35,
                      width: size.width * .55,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon:Icon(
                          Icons.favorite_border,
                          color: Colors.green,
                          size: 35.0,
                        ),
                        onPressed: (){},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(color: Colors.grey),
          Container(
            height: size.height * 0.10,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Product',style: TextStyle(fontSize: 18.0),),
                Text(
                  '59.99TL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
                Text('Taksitli Fiyat: 66.70 TL')
              ],
            ),
          ),
          Container(
            height: size.height * 0.05,
            child: Row(
              children: <Widget>[
                Container(
                  color: Colors.brown.withAlpha(100),
                  height: size.height * 0.05,
                  width: size.width * 0.2,
                  child: Center(child: Text('Renk',style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                Container(
                  color: Colors.brown.withAlpha(50),
                  height: size.height * 0.05,
                  width: size.width * 0.8,
                )
              ],
            ),
          ),
          Container(
            height: size.height * 0.05,
            child: Row(
              children: <Widget>[
                Container(
                  color: Colors.brown.withAlpha(100),
                  height: size.height * 0.05,
                  width: size.width * 0.2,
                  child: Center(child: Text('Miktar',style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                Container(
                  color: Colors.brown.withAlpha(50),
                  height: size.height * 0.05,
                  width: size.width * 0.8,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              elevation: 5.0,
              textTheme: ButtonTextTheme.primary,
              color: Colors.green,
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Sepete Ekle'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: OutlineButton(
                    onPressed: (){},
                    color: Colors.blue,
                    child: Text('Rate Us'),
                  ),
                ),
                SizedBox(width: 10.0,),
                Expanded(
                  child: OutlineButton(
                    onPressed: (){},
                    color: Colors.red,
                    child: Text('Paylas'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
