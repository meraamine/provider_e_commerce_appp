import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_products/providers/product_provider.dart';
import 'package:provider_products/screens/product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        home: ProductScreen(),
      ),
    );
  }
}
