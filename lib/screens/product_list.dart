import 'package:e_commerce_app/common/app_bar.dart';
import 'package:e_commerce_app/common/product.dart';
import 'package:e_commerce_app/screens/product_detail.dart';
import 'package:flutter/material.dart';



class ProductList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Wrap(
          children: <Widget>[
            Product(
              imagePath: 'http://tiny.cc/wxiw6y',
              price: 2.45,
              title: 'Banana',
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>ProductDetail()
                )
                );
              },
            ),
            Product(
              imagePath: 'http://tiny.cc/f2iw6y',
              price: 3.45,
              title: 'Orange',
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>ProductDetail()
                )
                );
              },
            ),
            Product(
              imagePath: 'http://tiny.cc/wxiw6y',
              price: 4.45,
              title: 'Banana',
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>ProductDetail()
                )
                );
              },
            ),
            Product(
              imagePath: 'http://tiny.cc/f2iw6y',
              price: 1.45,
              title: 'Orange',
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>ProductDetail()
                )
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context){
    return PreferredSize(
      child: MyAppBar(title: 'Some category',),
      preferredSize: Size(double.infinity, 58.0),
    );
  }
}
