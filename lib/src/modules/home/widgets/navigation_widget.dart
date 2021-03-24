import 'package:flutter/material.dart';
import 'package:newsapp/src/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class NavigationWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

    return BottomNavigationBar(
      currentIndex: homeController.currentPage,
      onTap: (i) => homeController.currentPage = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Para tí'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
      ]
    );
  }
}