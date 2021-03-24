import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:newsapp/src/data/models/category_model.dart';
import 'package:newsapp/src/data/models/news_models.dart';
import 'package:newsapp/src/data/repositories/news_repository.dart';

class HeadersController with ChangeNotifier {
  HeadersController(){
    categories.forEach( ( item ) {
      categoryArticles[ item.name ] = [];
     });
     getArticlesByCategory( selectedCategory );
  }
  final logger = Logger();
  final newsRepository = NewsRespository();
  
  String _selectedCategory = 'business';
  bool _loadingArticles = false;

  Map<String, List<Article>> categoryArticles = {};

  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business' ),
    Category( FontAwesomeIcons.tv, 'entertainment' ),
    Category( FontAwesomeIcons.addressCard, 'general' ),
    Category( FontAwesomeIcons.headSideVirus, 'health' ),
    Category( FontAwesomeIcons.vials, 'science' ),
    Category( FontAwesomeIcons.volleyballBall, 'sports' ),
    Category( FontAwesomeIcons.memory, 'technology' ),
  ];

  String get selectedCategory => _selectedCategory;
  bool get loadingArticles => _loadingArticles;

  List<Article> get getArticlesByCategorySelected => 
    categoryArticles[ selectedCategory  ]!;

  set loadingArticles ( bool value ){
    _loadingArticles = value;
    notifyListeners();
  }

  set selectedCategory( String value ){
    _selectedCategory = value;
    getArticlesByCategory( value );

    notifyListeners();
  }

  getArticlesByCategory( String category ) async {
    if ( categoryArticles[ category ]!.length > 0 ){
      return categoryArticles[ category ];
    }
    loadingArticles = true;
    final articles = await newsRepository.fetchArticlesByCategory( category );
    categoryArticles[ category ]!.addAll( articles );
    loadingArticles = false;

    notifyListeners();
  }  
}