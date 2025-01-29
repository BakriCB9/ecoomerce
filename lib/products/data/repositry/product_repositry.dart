import 'package:ecommerce/products/data/data_source/product_data_source.dart';
import 'package:ecommerce/products/data/model/products/products.dart';

class ProductRepositry {
  final ProductDataSource productDataSource;
  ProductRepositry(this.productDataSource);
  Future<List<Products>>getProduct(String productName)async{
    return productDataSource.getProducts(productName);
  }
}