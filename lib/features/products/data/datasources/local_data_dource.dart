import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exception.dart';
import 'package:e_commerce/core/helpers/hive_box.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductsLocalDatasource {
  Future<Unit> cashedProducts(List<Product> productsList);
  List<Product> getCachedProducts();
  Future<Unit> cachedCategories(List<String> cats);
  List<String> getCachedCats();
  Future<Unit> cashedProductsByCat(List<Product> productsList, String cat);
  List<Product> getCachedProductsByCat(String cat);
}

class ProductsLocalDatasourceImpl implements ProductsLocalDatasource {
  final SharedPreferences sharedPreferences;

  ProductsLocalDatasourceImpl(this.sharedPreferences);
  @override
  Future<Unit> cashedProducts(List<Product> productsList) async {
    for (var product in productsList) {
      await HiveBox.productsBox.add(product);
    }
    return Future.value(unit);
  }

  @override
  List<Product> getCachedProducts() {
    List<Product> products = [];
    for (int i = 0; i < HiveBox.productsBox.length; i++) {
      products.add(HiveBox.productsBox.get(i));
    }
    return products;
  }

  @override
  Future<Unit> cachedCategories(List<String> cats) async {
    for (var cat in cats) {
      await HiveBox.catsBox.add(cat);
    }
    return Future.value(unit);
  }

  @override
  List<String> getCachedCats() {
    List<String> cats = [];
    for (int i = 0; i < HiveBox.catsBox.length; i++) {
      cats.add(HiveBox.catsBox.get(i));
    }
    return cats;
  }

  @override
  Future<Unit> cashedProductsByCat(
      List<Product> productsList, String cat) async {
    for (var product in productsList) {
      await Hive.box(cat).add(product);
    }
    return Future.value(unit);
  }

  @override
  List<Product> getCachedProductsByCat(String cat) {
    List<Product> products = [];
    for (int i = 0; i < Hive.box(cat).length; i++) {
      products.add(Hive.box(cat).get(i));
    }
    return products;
  }
}
