import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveBox {
  static final productsBox = Hive.box("products");
  static final catsBox = Hive.box("cats");
}
