import 'package:flutter/material.dart';
import 'package:newsapp/src/data/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({ 
    required this.news, 
    required this.index 
  });
  final Article news;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard( news, index ),
        _TitleCard( news ),
        _ImageCard( news ),
        _BodyCard( news ),
        _ButtonsCard(),

        SizedBox( height: 10 ),
        Divider()
      ],
    );
  }
}

class _ButtonsCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){},
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
            child: Icon( Icons.star_border ),
          ),
          SizedBox( width: 20 ),
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue[800],
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
            child: Icon( Icons.more_horiz ),
          ),          
        ],
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article news;
  const _BodyCard( this.news );

  @override
  Widget build(BuildContext context) {
    final description = news.description;
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      child: Text( description ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Article news;
  const _ImageCard( this.news );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( vertical: 10 ),
      child: ClipRRect(
        borderRadius: BorderRadius.only( 
          topLeft: Radius.circular( 50 ),
          bottomRight: Radius.circular( 50 ) 
        ),
        child: Container(
          child: ( news.urlToImage != '' )
              ? FadeInImage(
                placeholder: AssetImage( 'assets/img/giphy.gif' ), 
                image: NetworkImage( news.urlToImage )
              )
              : Image.asset('assets/img/no-image.png'),
        ),
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article news;
  const _TitleCard( this.news );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 15 ),
      child: Text( 
        news.title, 
        style: TextStyle( 
          fontSize: 20, 
          fontWeight: FontWeight.w700 
        )
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  const _TopBarCard( this.news, this.index );
  final Article news;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 10 ),
      margin: EdgeInsets.only( bottom: 10 ),
      child: Row(
        children: [
          Text(
            '${ index + 1 }. ', 
            style: TextStyle( color: myTheme.accentColor ),
          ),
          Text('${ news.source.name }. ')          
        ],
      ),
    );
  }
}