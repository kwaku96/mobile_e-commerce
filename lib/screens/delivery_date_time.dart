import 'package:e_commerce_app/themes/text_themes.dart';
import 'package:flutter/material.dart';


class DeliveryDateTimePage extends StatefulWidget {
  @override
  _DeliveryDateTimePageState createState() => _DeliveryDateTimePageState();
}

class _DeliveryDateTimePageState extends State<DeliveryDateTimePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  Widget _appBar(BuildContext context){
    return AppBar(
      textTheme:  appBarTextTheme,
      iconTheme: appBarIconTheme,
      title: Text('Select a delivery date and time'),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  Widget _body(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[

          ],
        )
      ],
    );
  }

}
