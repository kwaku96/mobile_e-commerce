import 'package:e_commerce_app/common/home_tiles.dart';
import 'package:e_commerce_app/common/login_or_logout.dart';
import 'package:e_commerce_app/products/screen/products_screen.dart';
import 'package:e_commerce_app/themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../user_repo/user_repository.dart';
import 'cart.dart';
import 'favorites.dart';
import 'google_auth_screen.dart';
import 'product_list.dart';


class HomeScreen extends StatelessWidget {

  final UserRepository userRepository;

  HomeScreen({@required this.userRepository});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      drawer: _drawer(context),
      body: _body(context),
    );
  }


  Widget _appbar(BuildContext context){

    Size size = MediaQuery.of(context).size;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5.0,
      title: Text('Pazarcim',style: TextStyle(color: Colors.green),),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: (){
            //TODO open favorites
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>FavoritesPage())
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: (){
            //TODO open cart
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>CartPage())
            );
          },
        )
      ],

      bottom: PreferredSize(
        child: Card(
          margin: EdgeInsets.only(bottom: 10.0,left: 20.0,right: 10.0),
          elevation: 3.0,
          child: InkWell(
            child: Container(
              padding: EdgeInsets.only(left: 10.0,top:5.0,bottom: 5.0),
              width: size.width,
              height: 35.0,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Icon(Icons.search,color: Colors.green,),
                  SizedBox(width: 10.0,),
                  Text('Search product',style: TextStyle(color: Colors.green),)
                ],
              ),
            ),
            onTap: (){
              //TODO open search page
            },
          ),
        ),
        preferredSize: Size(size.width,40.0),
      ),

      iconTheme: IconThemeData(
          color: Colors.green
      ),
    );
  }


  Widget _drawer(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.15,
            child: Center(
              child: Text(
                'Pazarcim',
                style: Theme.of(context).textTheme.display2,
              ),
            ),
          ),
          LoginLogoutButton(
            userRepository: userRepository,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_basket,color: Colors.green,),
            title: Text('Siparis Takibi',style: greenTextStyle,),
            onTap: (){},
          ),
          Divider(),
          SizedBox(height: 10.0,),
          ListTile(
            leading: Icon(Icons.home,color: Colors.green,),
            title: Text('Anasayfa',style: greenTextStyle,),
            trailing: Icon(Icons.chevron_right,color: Colors.green,),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: SizedBox(width: 10.0,),
            title: Text('Fruits',style: greenTextStyle,),
            trailing: Icon(Icons.chevron_right,color: Colors.green,),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: SizedBox(width: 10.0,),
            title: Text('Vegetables',style: greenTextStyle,),
            trailing: Icon(Icons.chevron_right,color: Colors.green,),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: SizedBox(width: 10.0,),
            title: Text('Cereals',style: greenTextStyle,),
            trailing: Icon(Icons.chevron_right,color: Colors.green,),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: SizedBox(width: 10.0,),
            title: Text('Tubers',style: greenTextStyle,),
            trailing: Icon(Icons.chevron_right,color: Colors.green,),
            onTap: (){},
          ),
          Divider(),

          SizedBox(height: 15.0,),
          ListTile(
            leading: Icon(Icons.help,color: Colors.green,),
            title: Text('Yardim',style: greenTextStyle,),
            onTap: (){},
          )

        ],
      ),
    );
  }


  Widget _body(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.25,
          width: size.width,
          color: Colors.green.withAlpha(100),
          child: Carousel(
            boxFit: BoxFit.cover,
            images: [
              NetworkImage('http://tiny.cc/wrrw6y'),
              NetworkImage('http://tiny.cc/mtrw6y'),
              NetworkImage('http://tiny.cc/gvrw6y')
            ],
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.white,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.transparent,
            borderRadius: false,
            autoplay: false,
          ),
        ),
        SizedBox(height: 20.0,),
        Padding(
          padding: const EdgeInsets.only(top:8.0,bottom: 4.0,left: 8.0),
          child: Container(
              width: size.width,
              child: Text('Categories',style: Theme.of(context).textTheme.display2,)
          ),
        ),
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      HomeTile(
                        imagePath: 'http://tiny.cc/fmew6y',
                        height: size.height * 0.25,
                        width: size.width * 1.0,
                        label: 'fruits',
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)=>ProductsListScreen(
                                    category: 'fruit',
                                    title: 'Fruits',
                                  )
                              )
                          );
                        },
                      ),
                      HomeTile(
                        imagePath: 'http://tiny.cc/xpew6y',
                        height: size.height * 0.25,
                        width: size.width * 1.0,
                        label: 'Vegetables',
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)
                              =>ProductsListScreen(
                                category: 'vegetable',
                                title: 'Vegetables',
                              ))
                          );
                        },
                      ),
                      HomeTile(
                        imagePath: 'http://tiny.cc/otew6y',
                        height: size.height * 0.25,
                        width: size.width * 1.0,
                        label: 'Cereals',
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)=>ProductsListScreen()
                              )
                          );
                        },
                      ),
                      HomeTile(
                        imagePath: 'http://tiny.cc/gvew6y',
                        height: size.height * 0.25,
                        width: size.width * 1.0,
                        label: 'Tubers',
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)=>ProductsListScreen()
                              )
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

}
