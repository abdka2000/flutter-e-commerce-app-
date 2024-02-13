import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/data/repository/products_repository_impl.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';

class GetProductsByCategoryUsecase {
  final ProductsRepositoryImpl productsRepository;

  GetProductsByCategoryUsecase({required this.productsRepository});

  Future<Either<Failure, List<Product>>> call(String category) async {
    return await productsRepository.getProductsByCategory(category);
  }
}
