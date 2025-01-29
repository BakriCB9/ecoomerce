import 'package:ecommerce/products/data/repositry/product_repositry.dart';
import 'package:ecommerce/products/view_model/auth_state.dart';
import 'package:ecommerce/shared/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInit()){
  productRepositry=ProductRepositry(ServiceLocator.productDataSource);
  }  
  late final ProductRepositry productRepositry;

  Future<void> getProduct(String productName) async {
    try {
      print('the anser now hhhhhhhhh');
      emit(ProductLoading());
      final ans = await productRepositry.getProduct(productName);
      
      emit(ProductSuccess(ans));
    } catch (e) {
      emit(ProductError());
    }
  }
}
