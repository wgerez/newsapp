import 'package:newsapp/src/data/models/news_models.dart';
import 'package:newsapp/src/data/providers/news_api.dart';

class NewsRespository {
  final newsApi = NewsApi();

  Future<List<Article>> fetchTopHeadLines() async {
    return await newsApi.getTopHeadlines();
  }

Future<List<Article>> fetchArticlesByCategory( String category ) async {
    return await newsApi.getArticlesByCategories( category );
  }       
}