import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/data/repository/products_repository_impl.dart';


class DeleteProductUsecase {
  final ProductsRepositoryImpl productsRepository;

  DeleteProductUsecase(this.productsRepository);

  Future<Either<Failure, Unit>> call(int productId) async {
    return await productsRepository.deleteProduct(productId);
  }
}
