import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {

  final String imagePath;

  CartItem({
    @required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
      child: Container(
        height: size.height * 0.10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            _image(context, this.imagePath),

            Expanded(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _titleAndPrice(context),
                    _iconAndQuantity(context)
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _image(BuildContext context,String imagePath){
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      width: size.width * 0.2,
      height:  size.height * 0.09,
      child: Image(
        image: NetworkImage(imagePath),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _titleAndPrice(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Product name'),
          Text('29.99 TL',style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }

  Widget _iconAndQuantity(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.delete,color: Colors.black.withAlpha(100),),
            onPressed: (){},
          ),
          _kiloButton(context)
        ],
      ),
    );
  }

  Widget _kiloButton(BuildContext context){
    return InkWell(
      onTap: (){},
      child: Container(
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: Colors.green)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'KG',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.0),
            ),
            Text(
              '1',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

}
