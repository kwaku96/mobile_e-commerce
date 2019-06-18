import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {

  final double height;
  final double width;
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  HomeTile({
    @required this.height,
    @required this.width,
    @required this.imagePath,
    @required this.label,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(10.0),
        child: Container(
          height: this.height,
          width: this.width,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(
                image: NetworkImage(this.imagePath),
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    color: Colors.black.withAlpha(110),
                    child: Center(
                      child: Text(
                        this.label,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
