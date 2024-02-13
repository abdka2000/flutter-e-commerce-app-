import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<String>>> getCategories();
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Unit>> addProduct(Product product);
  Future<Either<Failure, Unit>> updateProduct(Product product);
  Future<Either<Failure, Unit>> deleteProduct(int productId);
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category);
}
