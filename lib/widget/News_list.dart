import 'package:flutter/material.dart';
import 'package:newsapp/Screens/News_card.dart';
import 'package:newsapp/api/Api_servies.dart';
import 'package:newsapp/models/NewsModel.dart';

class NewsList extends StatelessWidget {
  NewsList({super.key, required this.sourceId});
  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiServies.getNews(sourceId),
        builder: (context, Snapshot) {
          if (Snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (Snapshot.hasError) {
            return Center(
              child: Text('erorrrrr'),
            );
          }
          NewsModel? newsModel = Snapshot.data;
          var newsList = newsModel?.articles ?? [];
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: newsList.length,
              itemBuilder: (context, index) =>
                  NewsCard(newsModel: newsList[index]));
        });
  }
}
