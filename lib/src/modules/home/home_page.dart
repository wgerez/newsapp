import 'package:flutter/material.dart';
import 'package:newsapp/src/modules/home/home_controller.dart';
import 'package:newsapp/src/modules/home/widgets/navigation_widget.dart';

import 'package:newsapp/src/modules/home/widgets/pages_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
//17ef74733c5049c5ad419e5078aa9b44
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Scaffold(
        body: PagesWidget(),
        bottomNavigationBar: NavigationWidget(),
      ),
    );
  }
}