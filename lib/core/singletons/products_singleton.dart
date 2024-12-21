import 'package:awfar_offers_dash/features/products/data/models/product.dart';

class ProductsSingleton {
  List<Product>? _products;
  static final ProductsSingleton _instance = ProductsSingleton._internal();
  ProductsSingleton._internal();
  static ProductsSingleton get instance => _instance;
  List<Product>? get products => _products;
  set products(List<Product>? products) {
    _products = products;
  }

  void clearProducts() {
    _products = null;
  }
}
