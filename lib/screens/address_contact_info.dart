import 'package:e_commerce_app/themes/general_styles.dart';
import 'package:e_commerce_app/themes/text_themes.dart';
import 'package:flutter/material.dart';


class AddressContactPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  Widget _appBar(BuildContext context){
    return AppBar(
      textTheme: appBarTextTheme,
      iconTheme: appBarIconTheme,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text('ADDRESS'),
    );
  }

  Widget _body(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 21.0,top: 15.0),
          child: Text('Your Address',style: TextStyle(
              color: Colors.black.withAlpha(150)
            ),
          ),
        ),
        _addressFull(context),
        _nameAddressNumber(context),
        _saveOrProceedButton(context)
      ],
    );
  }

  Widget _addressFull(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
        height: size.height * .145 ,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              autofocus: false,
              maxLines: 4,
              decoration: inputDecoration(''),
            ),
          ],
        ),
      ),
    );
  }

  Widget _nameAddressNumber(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
        width: size.width,
        height: size.height * .15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              autofocus: false,
              decoration: inputDecoration('Full Name'),
            ),
            TextField(
              autofocus: false,
              decoration: inputDecoration('Mobile Number'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _saveOrProceedButton(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15.0),
      child: RaisedButton(
        elevation: 2.0,
        color: Colors.green,
        onPressed: (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('SAVE',style: buttonTextTheme,),
          ],
        ),
      ),
    );
  }
}
