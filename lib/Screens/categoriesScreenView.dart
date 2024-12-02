import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/AppImages.dart';

import 'package:newsapp/common/category/category_card.dart';
import 'package:newsapp/common/category/category_model.dart';

// ignore: must_be_immutable
class CategoriesScreenView extends StatelessWidget {
  CategoriesScreenView({super.key, required this.onSelect});
  final Function(CategoryModel) onSelect;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categeries = [
      CategoryModel(
          id: 'sports',
          imagePath: AppImages.ballLogo,
          title: 'Sports',
          color: Colors.red),
      CategoryModel(
          id: 'general',
          imagePath: AppImages.politicsLogo,
          title: 'Politics',
          color: Color(0xff003E90)),
      CategoryModel(
          id: 'health',
          imagePath: AppImages.healthLogo,
          title: 'Health',
          color: Colors.pink),
      CategoryModel(
          id: 'business',
          imagePath: AppImages.bussinesLogo,
          title: 'Business',
          color: Colors.brown),
      CategoryModel(
          id: 'entertainment',
          imagePath: AppImages.enviromentlogo,
          title: 'Enviroment',
          color: Colors.blue),
      CategoryModel(
          id: 'science',
          imagePath: AppImages.scienceLogo,
          title: 'Science',
          color: Colors.yellow)
    ];

    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: (Column(
            children: [
              Text(
                'pick your categort  of interest',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 40.w),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 100.h,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h),
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () => onSelect(categeries[index]),
                        child: CategoryCard(categeries[index], index)),
                    itemCount: categeries.length,
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
