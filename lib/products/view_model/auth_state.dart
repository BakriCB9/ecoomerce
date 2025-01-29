import 'package:ecommerce/products/data/model/products/products.dart';

abstract class ProductState{}
class ProductInit extends ProductState{

}
class ProductLoading extends ProductState{}
class ProductSuccess extends ProductState{
 final  List<Products>list;
 ProductSuccess(this.list);
}
class ProductError extends ProductState{}