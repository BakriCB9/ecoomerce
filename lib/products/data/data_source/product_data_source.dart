import 'package:ecommerce/products/data/model/products/products.dart';

abstract class ProductDataSource {
    Future<List<Products>> getProducts(String productName);
}