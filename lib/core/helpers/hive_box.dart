import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveBox {
  static final productsBox = Hive.box("products");
  static final catsBox = Hive.box("cats");
}
