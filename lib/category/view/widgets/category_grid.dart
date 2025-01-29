import 'package:ecommerce/category/data/model/category_model.dart';
import 'package:ecommerce/products/view/product_screen.dart';
import 'package:ecommerce/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listOfCategory.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 4),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              ServiceLocator.productCubit.getProduct(listOfCategory[index].title);
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProductScreen()));
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    image: DecorationImage(
                        image: AssetImage(
                          listOfCategory[index].image,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: listOfCategory[index].color,
                  ),
                  child: Center(
                    child: FittedBox(
                        child: Text(
                      listOfCategory[index].title,
                      style: TextStyle(
                          fontSize: 35.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            ),
          );
        });
  }
}
