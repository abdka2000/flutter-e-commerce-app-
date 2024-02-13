import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/data/repository/products_repository_impl.dart';

import '../entities/product_entity.dart';

class AddProductUsecase {
  final ProductsRepositoryImpl productsRepository;

  AddProductUsecase(this.productsRepository);
  
  Future<Either<Failure, Unit>> call(Product product) async {
    return await productsRepository.addProduct(product);
  }
}
