import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:newsapp/src/data/models/news_models.dart';
import 'package:newsapp/src/data/repositories/news_repository.dart';

class TopHeadLinesController with ChangeNotifier {
  final logger = Logger();
  final newsRepository = NewsRespository();

  List<Article> headLines = [];

// business entertainment general health science sports technology
  TopHeadLinesController(){
    getTopHeadLines();
  }

  void getTopHeadLines() async {
    try {
      headLines.addAll(await newsRepository.fetchTopHeadLines());
      notifyListeners();
    } catch (e) {
      logger.d('ERROR: $e');
    }
  }
}