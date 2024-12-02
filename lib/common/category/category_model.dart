import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  final String imagePath;
  final String title;
  final Color color;

  CategoryModel(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.color});
}
