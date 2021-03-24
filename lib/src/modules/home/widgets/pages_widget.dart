import 'package:flutter/material.dart';
import 'package:newsapp/src/modules/headers/headers_page.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/modules/topHeadLines/top_head_lines_page.dart';
import 'package:newsapp/src/modules/home/home_controller.dart';

class PagesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

    return PageView(
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      controller: homeController.pageController,
      children: [
        TopHeadLines(),
        HeadersPage()          
      ],
    );
  }
}