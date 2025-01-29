
import 'package:dio/dio.dart';
import 'package:ecommerce/products/data/data_source/product_data_source.dart';
import 'package:ecommerce/products/data/model/products/products.dart';
import 'package:ecommerce/shared/api_const.dart';

class ProductApiDataSource extends ProductDataSource{
  @override
  Future<List<Products>> getProducts(String productName) async{
    Dio _dio=Dio(BaseOptions(baseUrl:ApiConstant.baseUrl ,receiveDataWhenStatusError: true));
    try{
      print('the value from inside now is **************************');
       final response = await  _dio.get('${ApiConstant.productEndPoint}/$productName');
         print('the response is ###########################################');
         print(response);
         print('');
         return [];
    }catch (e){
       throw Exception('Failed to get Product');
    }
    
  }

}