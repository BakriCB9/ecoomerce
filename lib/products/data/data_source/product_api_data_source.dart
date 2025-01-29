
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
           var response = await  _dio.get('${ApiConstant.productEndPoint}/$productName');
         
           List<dynamic>list=response.data;
         //  print('the response data is $list');
           List<Products>listOfItem=[];         

        
        for(int i=0;i<list.length;i++){
          print('the item is $i');
          listOfItem.add(Products.fromJson(list[i]));
          print('the value of item is ${listOfItem[i].image} and rate is ${listOfItem[i].rating!.rate}');
          
        }
        print('the lenght is ${listOfItem.length}');
        for(int i=0;i<listOfItem.length;i++){
          print('the value of item is ${listOfItem[i].image} and rate is ${listOfItem[i].rating!.rate}');
        }
        print('the response is ###########################################');
         print(response);
         print('');
         return listOfItem;
    }catch (e){
       throw Exception('Failed to get Product');
    }
    
  }

}