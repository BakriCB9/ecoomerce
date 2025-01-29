import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/products/view_model/auth_cubit.dart';
import 'package:ecommerce/products/view_model/auth_state.dart';
import 'package:ecommerce/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ProductCubit, ProductState>(
            bloc: ServiceLocator.productCubit,
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductError) {
                return const Center(
                  child: Text('Failed to get Items'),
                );
              } else if (state is ProductSuccess) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
                  child: GridView.builder(
                      itemCount: state.list.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 3 / 5),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(25.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 300.h,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25.r),
                                      
                                      child: CachedNetworkImage(

                                        imageUrl: state.list[index].image!,
                                        fit: BoxFit.contain,
                                        placeholder: (context, _) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        },
                                        errorWidget: (context, url, error) {
                                          return const Icon(Icons.error);
                                        },
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 2,
                                      child: Container(
                                        
                                        width: 60.w,
                                        height: 60.h,
                                    decoration:const  BoxDecoration(
                                        boxShadow: [BoxShadow(blurRadius: 1)],
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                        child: Icon(Icons.favorite_border,color: Colors.blue,),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.list[index].title!,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    state.list[index].description!,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'EGP ${state.list[index].price}',
                                    style: TextStyle(
                                        fontSize: 22.sp, color: Colors.blue),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Review(${state.list[index].rating!.rate})',
                                        style: TextStyle(fontSize: 21.sp),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                );
              } else {
                return const SizedBox();
              }
            }));
  }
}
