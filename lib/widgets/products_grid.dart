import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../providers/product.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    print(Provider.of<Products>(context).toString());
    final productsData = Provider.of<Products>(context);
    final products = showFavs? productsData.favoriteItems : productsData.items;
    print("In grid");
    print(productsData.items);

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(
//          products[index].id,
//          products[index].title,
//          products[index].imageUrl,
//          products[index].price,
        ),
      ),
      itemCount: products.length,
    );
  }
}
