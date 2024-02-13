import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/data/repository/products_repository_impl.dart';

import '../entities/product_entity.dart';

class UpdateProductUsecase {
  final ProductsRepositoryImpl productsRepository;

  UpdateProductUsecase(this.productsRepository);
  
  Future<Either<Failure, Unit>> call(Product product) async {
    return await productsRepository.updateProduct(product);
  }
}
