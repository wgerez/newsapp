import 'package:flutter/material.dart';
import 'package:newsapp/src/modules/headers/headers_controller.dart';
import 'package:newsapp/src/modules/home/home_page.dart';
import 'package:newsapp/src/modules/topHeadLines/top_head_lines_controller.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TopHeadLinesController()),
        ChangeNotifierProvider(create: (_) => HeadersController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomePage(),
        theme: myTheme,
      ),
    );
  }
}