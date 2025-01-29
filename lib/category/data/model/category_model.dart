import 'package:ecommerce/shared/app_image.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String image;
  final String title;
  final Color color;
  const CategoryModel(
      {required this.color, required this.image, required this.title});
}

List<CategoryModel> listOfCategory = [
  CategoryModel(
      image: AppImage.jeweleryImage,
      title: 'jewelery',
      color: Colors.yellow.withOpacity(0.6)),
  CategoryModel(
      image: AppImage.womenImage,
      title: "women's clothing",
      color: Colors.pink.withOpacity(0.6)),
  CategoryModel(
      image: AppImage.menImage,
      title: "men's clothing",
      color: Colors.black.withOpacity(0.6)),
  CategoryModel(
      image: AppImage.electronImage,
      title: 'electronics',
      color: Colors.blue.withOpacity(0.6))
];
