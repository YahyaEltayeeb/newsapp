import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/category/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
    this.categoryModel,
    this.index, {
    super.key,
  });
  final CategoryModel categoryModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryModel.imagePath,
            width: 50.w,
          ),
          Text(
            categoryModel.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w400),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: index.isEven ? Radius.circular(25) : Radius.circular(0),
            bottomRight:
                index.isOdd ? Radius.circular(25) : Radius.circular(0)),
      ),
    );
  }
}
