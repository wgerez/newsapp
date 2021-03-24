import 'package:flutter/material.dart';
import 'package:newsapp/src/data/models/category_model.dart';
import 'package:newsapp/src/modules/headers/headers_controller.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:newsapp/src/widgets/news_list_widget.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headersController = Provider.of<HeadersController>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _CategoriesList(),
            Expanded(
              child:  headersController.loadingArticles
                ? Center( child: CircularProgressIndicator() )
                : NewsListWidget( headersController.getArticlesByCategorySelected ),
            )
          ],
        ),
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final headersController = Provider.of<HeadersController>(context);
    final categories = headersController.categories;

    return Container(
      width: double.infinity,
      height: 85,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = categories[index].name;
          final name = '${cName[0].toUpperCase()}${cName.substring(1)}';

          return GestureDetector(
            onTap: (){
              headersController.selectedCategory = categories[index].name;
            },
            child: Container(
              margin: EdgeInsets.symmetric( vertical: 10 ),
              width: 90,
              child: Column(
                children: [
                  _CategoryButton( categories[index] ),
                  SizedBox( height: 5, ),
                  Text( name )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton( this.category );
  final Category category;

  @override
  Widget build(BuildContext context) {
    final selectedCategory = Provider.of<HeadersController>(context).selectedCategory;
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white
      ),
      child: Icon( 
        category.icon,
        color: ( selectedCategory == category.name ) 
          ? myTheme.accentColor 
          : Colors.black54 
      ),
    );
  }
}