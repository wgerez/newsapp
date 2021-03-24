import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp/src/data/models/news_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '17ef74733c5049c5ad419e5078aa9b44';

class NewsApi {
  final logger = Logger();

  Future<List<Article>> getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=ar';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson( resp.body );

    return newsResponse.articles;
  }

  Future<List<Article>> getArticlesByCategories( String category ) async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=ar&category=$category';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson( resp.body );

    return newsResponse.articles;
  }  
}