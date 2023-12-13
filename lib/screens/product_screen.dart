import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_products/providers/product_provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                productProvider.fetchProducts();
              },
              child: Text('Fetch Products'),
            ),
            SizedBox(height: 16),
            if (productProvider.products.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: productProvider.products.length,
                itemBuilder: (context, index) {
                  final product = productProvider.products[index];
                  return ListTile(
                    title: Text('${product.name}'),
                    subtitle: Text('\$${product.price?.toStringAsFixed(2)}'),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
