import 'package:flutter/material.dart';

class Product extends StatefulWidget {

  final double price;
  final String title;
  final String imagePath;
  bool liked;
  VoidCallback onTap;

  Product({
    @required this.title,
    @required this.price,
    @required this.imagePath,
    this.liked = false,
    @required this.onTap
  });

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
      elevation: 5.0,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: size.width * .45,
          height: size.height * .4,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: size.width * .45,
                  color: Colors.black.withAlpha(100),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(
                        widget.imagePath,
                        fit: BoxFit.fitHeight,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: Icon(
                                widget.liked ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.green,
                                size: 35.0,
                              ),
                              onPressed: (){

                                setState(() {
                                  widget.liked = !widget.liked;
                                });

                                //TODO add to favorites
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 4.0),
                child: Text(widget.title),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Text(
                  '${widget.price} TL',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
