import 'package:flutter/material.dart';

class CartTotalPrice extends StatefulWidget {
  @override
  _CartTotalPriceState createState() => _CartTotalPriceState();
}

class _CartTotalPriceState extends State<CartTotalPrice> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      elevation: 6.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: size.height * .25,
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'KAMPANYA KODU'
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                RaisedButton(
                  elevation: 5.0,
                  color: Colors.white,
                  child: Text('KULLAN'),
                  onPressed: (){},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Toplam',style: TextStyle(fontSize: 18.0),),
                Text('259.93',style: TextStyle(fontSize: 18.0))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Ara Toplam',style: TextStyle(fontSize: 18.0),),
                Text('259.93',style: TextStyle(fontSize: 18.0))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Kargo Ucreti',style: TextStyle(fontSize: 18.0),),
                Text('0.00',style: TextStyle(fontSize: 18.0))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Genel Toplam',style: TextStyle(fontSize: 18.0),),
                Text('259.93',style: TextStyle(fontSize: 18.0))
              ],
            )

          ],
        ),
      )
    );
  }
}
