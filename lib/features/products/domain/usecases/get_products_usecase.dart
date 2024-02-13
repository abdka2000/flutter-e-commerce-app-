import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/data/repository/products_repository_impl.dart';

import '../entities/product_entity.dart';

class GetAllProductsUsecase {
  final ProductsRepositoryImpl productsRepository;

  GetAllProductsUsecase(this.productsRepository);

  Future<Either<Failure, List<Product>>> call() async {
    return await productsRepository.getAllProducts();
  }
}
