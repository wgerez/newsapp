import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/modules/topHeadLines/top_head_lines_controller.dart';
import 'package:newsapp/src/widgets/news_list_widget.dart';

class TopHeadLines extends StatefulWidget {

  @override
  _TopHeadLinesState createState() => _TopHeadLinesState();
}

class _TopHeadLinesState extends State<TopHeadLines> with AutomaticKeepAliveClientMixin {

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final topHeadLinesProvider = Provider.of<TopHeadLinesController>(context);
    final news = topHeadLinesProvider.headLines;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: news.length == 0
            ? Center(child: CircularProgressIndicator())
            : NewsListWidget( news ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}