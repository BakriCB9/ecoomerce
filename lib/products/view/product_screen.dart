import 'package:ecommerce/products/view_model/auth_cubit.dart';
import 'package:ecommerce/products/view_model/auth_state.dart';
import 'package:ecommerce/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              }
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 3 / 4),
                  itemBuilder: (context, index) {
                    return Container();
                  });
            }));
  }
}
