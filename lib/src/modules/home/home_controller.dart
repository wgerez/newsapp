import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  int get currentPage => _currentPage;
  PageController get pageController => _pageController;

  set currentPage(int value){
    _currentPage = value;
    _pageController.animateToPage(
      value, 
      duration: Duration(milliseconds: 250), 
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
  
}