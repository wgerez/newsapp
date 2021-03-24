import 'package:flutter/material.dart';
import 'package:newsapp/src/data/models/news_models.dart';
import 'package:newsapp/src/widgets/news_widget.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget(this.news);
  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
      return NewsWidget(
        news: news[index], 
        index: index
      );
     },
    );
  }
}

