import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Screens/HomeScreen.dart';
import 'package:newsapp/Screens/categoriesScreenView.dart';
import 'package:newsapp/common/AppColors.dart';
import 'package:newsapp/common/category/category_card.dart';
import 'package:newsapp/models/NewsModel.dart';
import 'package:timeago/timeago.dart' as timeago;

// ignore: must_be_immutable
class NewsCard extends StatelessWidget {
  NewsCard({super.key, required this.newsModel});
  Articles newsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              child: Image.network(
            newsModel.urlToImage ?? '',
            height: 130.h,
            width: double.infinity,
          )),
          Text(
            newsModel.author ?? '',
            style: TextStyle(
              color: AppColors.grayColor,
              fontSize: 10,
            ),
          ),
          Text(
            newsModel.description ?? '',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(newsModel.content ?? ''),
          Align(
            child: Text(
              timeago.format(DateTime.parse(newsModel.publishedAt ?? '')),
              style: TextStyle(color: AppColors.grayColor, fontSize: 10),
            ),
            alignment: Alignment.bottomRight,
          )
        ],
      ),
    );
  }
}
