import 'package:ecommerceflutter/provider/app_provider.dart';
import 'package:ecommerceflutter/provider/user_provider.dart';
import 'package:ecommerceflutter/screens/product_details.dart';
import 'package:ecommerceflutter/widgets/custom_app_bar.dart';
import 'package:ecommerceflutter/widgets/featured_products.dart';
import 'package:ecommerceflutter/widgets/product_card.dart';
import 'package:ecommerceflutter/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
//           Custom App bar
            CustomAppBar(),

//          Search Text field
            Search(),

//            featured products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Featured products')),
                ),
              ],
            ),
            FeaturedProducts(),

            Text(appProvider.featureProducts.length.toString(), style: TextStyle(color: Colors.black),),
//          recent products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Recent products')),
                ),
              ],
            ),

            ProductCard(
              brand: 'SantosBrand',
              name: 'Lux Blazer',
              price: 24.00,
              onSale: true,
              picture: '',
            ),
          ],
        ),
      ),
    );
  }
}