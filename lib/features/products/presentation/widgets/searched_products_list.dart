
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsSearchList extends StatelessWidget {
  const ProductsSearchList({
    super.key,
    required this.products,
    required this.searchedProducts,
  });

  final List<Product> products;
  final List<Product> searchedProducts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: GridView.builder(
            itemCount:
                searchedProducts.isNotEmpty ? searchedProducts.length : 1,
            padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.6,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: ((context, index) {
              return searchedProducts.isNotEmpty
                  ? ProductItem(product: searchedProducts[index])
                  : Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: const Center(
                        child: Text("NoResult.." , style: TextStyle(color: Colors.white , fontSize: 20),),
                      ),
                  );
            })),
      ),
    );
  }
}

