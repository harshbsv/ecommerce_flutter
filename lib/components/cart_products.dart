import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var products_on_the_cart = [
    {
      "name": "Men's Blazers",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "XXL",
      "color": "Black",
      "quantity": "1",
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "price": 40,
      "size": "US11",
      "color": "Black",
      "quantity": "1",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products_on_the_cart.length,
        itemBuilder: (context, index){
          return Single_cart_product(
            cart_prod_name: products_on_the_cart[index]["name"],
            cart_prod_picture: products_on_the_cart[index]["picture"],
            cart_prod_price: products_on_the_cart[index]["price"],
            cart_prod_size: products_on_the_cart[index]["size"],
            cart_prod_color: products_on_the_cart[index]["color"],
            cart_prod_qty: products_on_the_cart[index]["quantity"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_prod_picture, width: 80.0,),
        title: Text(cart_prod_name),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // product size section.
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cart_prod_size, style: TextStyle(color: Colors.red),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 15.0, 8.0, 15.0),
                  child: Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cart_prod_color, style: TextStyle(color: Colors.red),),
                ),
              ],
            ),
            // This section is for the product price
            Container(
              alignment: Alignment.topLeft,
              child: Text("\$${cart_prod_price}", style: TextStyle(color: Colors.red, fontSize: 18.0, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_drop_up, color: Colors.red,), iconSize: 38.0, onPressed: (){},),
              Text(cart_prod_qty, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
              IconButton(icon: Icon(Icons.arrow_drop_down, color: Colors.red,), iconSize: 38.0, onPressed: (){},),
            ],
          ),
        ),
      ),
    );
  }
}


