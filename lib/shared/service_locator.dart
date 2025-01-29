import 'package:ecommerce/products/data/data_source/product_api_data_source.dart';
import 'package:ecommerce/products/data/data_source/product_data_source.dart';
import 'package:ecommerce/products/data/repositry/product_repositry.dart';
import 'package:ecommerce/products/view_model/auth_cubit.dart';

class ServiceLocator{
  static ProductDataSource productDataSource=ProductApiDataSource();
  static ProductCubit productCubit=ProductCubit();
  
}