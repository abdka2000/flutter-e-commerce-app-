import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exception.dart';
import 'package:e_commerce/core/string/end_points.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<String>> getAllCat();
  Future<Unit> addProduct(ProductModel productModel);
  Future<Unit> updateProduct(ProductModel productModel);
  Future<Unit> deleteProduct(int productId);
  Future<List<ProductModel>> getProductsByCategory(String category);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final client = http.Client();
  @override
  Future<List<String>> getAllCat() async {
    final response = await client.get(Uri.parse(GETCATS_ENDPOINT));
    if (response.statusCode == 200) {
      final List jsonDecoded = json.decode(response.body);
      List<String> cats =
          jsonDecoded.map((jsonCat) => jsonCat.toString()).toList();
      return cats;
    } else {
      throw ServerException;
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(Uri.parse(GETPRODUCTS_ENDPOINT));
    if (response.statusCode == 200) {
      final List jsonDecoded = json.decode(response.body);
      List<ProductModel> productModels = jsonDecoded
          .map((jsonProduct) => ProductModel.fromJson(jsonProduct))
          .toList();
      return productModels;
    } else {
      throw ServerException;
    }
  }

  @override
  Future<Unit> addProduct(ProductModel productModel) async {
    final body = {
      
      "title": productModel.title,
      "price": productModel.price.toString(),
      "description": productModel.description,
      "image": productModel.image,
      "category": productModel.category,
    };

    final response =
        await client.post(Uri.parse(ADD_UPDATE_DELETE), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteProduct(int productId) async {
    final response = await client.delete(Uri.parse(ADD_UPDATE_DELETE));
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateProduct(ProductModel productModel) async {
    final body = {
      "title": productModel.title,
      "price": productModel.price,
      "description": productModel.description,
      "image": productModel.image,
      "category": productModel.category,
    };

    final response = await client
        .put(Uri.parse("$ADD_UPDATE_DELETE/${productModel.id}"), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await client.get(Uri.parse("$GET_BY_CAT_ENDPOINT$category"));
    if (response.statusCode == 200) {
      final List jsonDecoded = json.decode(response.body);
      List<ProductModel> products =
          jsonDecoded.map((product) => ProductModel.fromJson(product)).toList();
      return products;
    } else {
      throw ServerException();
    }
  }
}
