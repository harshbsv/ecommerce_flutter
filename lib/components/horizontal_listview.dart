import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/categories/tshirt.png',
            image_caption: 'T-Shirt',
          ),
          Category(
            image_location: 'images/categories/jeans.png',
            image_caption: 'Jeans',
          ),
          Category(
            image_location: 'images/categories/informal.png',
            image_caption: 'Informals',
          ),
          Category(
            image_location: 'images/categories/formal.png',
            image_caption: 'Formals',
          ),
          Category(
            image_location: 'images/categories/dress.png',
            image_caption: 'Dresses',
          ),
          Category(
            image_location: 'images/categories/shoe.png',
            image_caption: 'Shoes',
          ),
          Category(
            image_location: 'images/categories/accessories.png',
            image_caption: 'Accessories',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  Category({this.image_location, this.image_caption,});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(onTap: (){},
      child: Container(
        width: 100.0,
        child: ListTile(
            title: Image.asset(image_location, width: 80.0, height: 80.0,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption, style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),),
              ),
            )
          ),
      ),
    );
  }
}
