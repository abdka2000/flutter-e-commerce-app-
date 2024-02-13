import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/data/repository/products_repository_impl.dart';


class GetAllCategoriesUsecase {
  final ProductsRepositoryImpl productsRepository;

  GetAllCategoriesUsecase(this.productsRepository);

  Future<Either<Failure, List<String>>> call() async {
    return await productsRepository.getCategories();
  }
}
