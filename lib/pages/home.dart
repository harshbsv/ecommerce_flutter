import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerceflutter/components/products.dart';
import 'package:ecommerceflutter/components/horizontal_listview.dart';
import 'package:ecommerceflutter/pages/cart.dart';
import 'package:ecommerceflutter/pages/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 250.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/c1.jpg"),
          AssetImage("images/m1.jpeg"),
          AssetImage("images/w1.jpeg"),
          AssetImage("images/w3.jpeg"),
          AssetImage("images/w4.jpeg"),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.pink,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink,
        title: Text('Buy It'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
          })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //header
            new UserAccountsDrawerHeader(
              accountName: Text('Harshvardhan'),
              accountEmail: Text('harsh@ymail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.pink,),
            ),
            // Body
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
              },
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Login()));
              },
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.red,),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blue,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.blue,),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //image carousel begins here.
          image_carousel,
          //padding widget
          new Padding(padding: const EdgeInsets.all(10.0),
            child: new Text('Categories', textScaleFactor: 1.0,),),
          //Horizontal list view begins here
          HorizontalList(),
          new Padding(padding: const EdgeInsets.all(10.0),
            child: new Text('Recent Products', textScaleFactor: 1.0,),),
          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
