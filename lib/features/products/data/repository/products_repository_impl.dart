import 'dart:html';

import 'package:e_commerce/core/errors/exception.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/network/network_info.dart';
import 'package:e_commerce/features/products/data/datasources/local_data_dource.dart';
import 'package:e_commerce/features/products/data/datasources/remote_data_dource.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSourceImpl remoteDataSource;
  final ProductsLocalDatasourceImpl localDatasource;
  final NetworkInfo networkInfo;

  ProductsRepositoryImpl(
      this.remoteDataSource, this.networkInfo, this.localDatasource);
  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.checkConnect()) {
      try {
        List<ProductModel> products = await remoteDataSource.getAllProducts();
        await localDatasource.cashedProducts(products);
        return Right(products);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        List<Product> products = localDatasource.getCachedProducts();
        print("-------------------- $products");
        return Right(products);
      } on EmptyCachException {
        print("-----------empty");
        return Left(EmptyCachFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    if (await networkInfo.checkConnect()) {
      try {
        List<String> cats = await remoteDataSource.getAllCat();
        await localDatasource.cachedCategories(cats);
        return Right(cats);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        List<String> catsList = localDatasource.getCachedCats();
        return Right(catsList);
      } on EmptyCachException {
        return Left(EmptyCachFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(int productId) async {
    if (await networkInfo.checkConnect()) {
      try {
        await remoteDataSource.deleteProduct(productId);
        return const Right(unit);
      } on ServerException{
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addProduct(Product product) async {
    ProductModel productModel = ProductModel(
       
        title: product.title,
        price: product.price,
        category: product.category,
        description: product.description,
        image: product.image,
       );
    if (await networkInfo.checkConnect()) {
      try {
        await remoteDataSource.addProduct(productModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateProduct(Product product) async {
    ProductModel productModel = ProductModel(
        id: product.id,
        title: product.title,
        price: product.price,
        category: product.category,
        description: product.description,
        image: product.image,
        rating: product.rating);
    if (await networkInfo.checkConnect()) {
      try {
        await remoteDataSource.updateProduct(productModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
      String category) async {
    if (await networkInfo.checkConnect()) {
      try {
        List<ProductModel> products =
            await remoteDataSource.getProductsByCategory(category);
        await localDatasource.cashedProductsByCat(products , category);
        return Right(products);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        List<Product> products = localDatasource.getCachedProductsByCat(category);
        return Right(products);
      } on EmptyCachException {
        return Left(EmptyCachFailure());
      }
    }
  }
}
