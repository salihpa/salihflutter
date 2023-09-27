import 'package:flutter/material.dart';

import 'detailsPage.dart';
import 'dummydata.dart';

void main() {
  runApp(MaterialApp(
    home: ProductMain(),
    routes: {
      'details': (context) => ProductDetails(),
      // 'home':(context) => Home()
    },
  ));
}

class ProductMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: GridView(
          padding: const EdgeInsets.all(15),

          /// products list le oro map um one by one ayit  product il varum since list.map() is iterable
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: List.generate(
              products.length,
              (index) => InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed('details', arguments: products[index]['id']),
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          products[index]['image'])))),
                          Text(products[index]['name']),
                          Text('${products[index]['price']}\$'),
                        ],
                      ),
                    ),
                  ))
          // .toList(),
          ),
    );
  }
}
