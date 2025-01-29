import 'package:ecommerce/category/view/widgets/category_grid.dart';
import 'package:ecommerce/products/data/data_source/product_api_data_source.dart';
import 'package:ecommerce/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    ServiceLocator.productCubit.getProduct('jewelery');
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
            ),
            FittedBox(
              child: Text(
                'Choose your Category ',
                style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
              ),
            ),
            const Expanded(child: CategoryGrid())
          ],
        ),
      ),
    );
  }
}
