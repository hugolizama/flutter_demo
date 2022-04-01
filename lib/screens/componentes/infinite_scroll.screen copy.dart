import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '/ui/ui.dart';
import '/services/services.dart';
import '/models/modes.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({Key? key}) : super(key: key);

  @override
  _InfiniteScrollScreenState createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  ScrollController _scrollController = new ScrollController();  
  int _page = 1;
  List<Article> _articulos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _scrollController..addListener(() {
      if(_scrollController.position.pixels > _scrollController.position.maxScrollExtent - 100){
        // _agregar10();
        //print('agregar');

        //_articulos..add()
        _scrollController.animateTo(
          _scrollController.position.pixels + 100, 
          duration: Duration(seconds: 1), 
          curve: Curves.fastOutSlowIn
        );
      }
    });
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Infinte Scroll'),
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: FutureBuilder(
          future: newsService.getArticles(page: 1),          
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if(snapshot.hasData){
              _articulos = snapshot.data!;
               return ListView.builder(      
                 controller: _scrollController,        
                 itemCount:_articulos.length,
                 itemBuilder: (BuildContext context, int index) {
                   return ArticleCardWidget( articulo: _articulos[index], index: index, );
                 },
               );
        
            } else {
        
              return LoaderWidget();
              
            }           
          },
        ),
      ),
    );
  }
}

class ArticleCardWidget extends StatelessWidget {
  final Article articulo;
  final int index;
  
  const ArticleCardWidget({
    Key? key, 
    required this.articulo, 
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Text(
                '${ index + 1 }. ',
                style: TextStyle(color: errorColor),
              ),
              Text(
                articulo.source.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),


        Container(
          margin: EdgeInsets.only(bottom: 5),
          alignment: Alignment.centerLeft,
          child: Text(
            articulo.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),


        Container(
          margin: EdgeInsets.only(bottom: 5),
          width: double.infinity,
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            child: FittedBox(
              fit: BoxFit.cover,
              child: (articulo.urlToImage != null) 
                ? FadeInImage (
                  placeholder: AssetImage('assets/img/news_loading_img.gif'), 
                  image: NetworkImage( articulo.urlToImage! )
                )
                : Image(image: AssetImage('assets/img/no-image.png')),
              
              
              /*Image(
                image: AssetImage('assets/img/news_loading_img.gif'),
              ),*/
            ),
          ),
        ),


        Container(
          margin: EdgeInsets.only(bottom: 5),
          alignment: Alignment.centerLeft,
          child: Text(
            articulo.description == null ? '' : articulo.description!,
            textAlign: TextAlign.justify,
          ),
        ),

        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: MaterialButtonCustom(
            text: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.article_outlined),
                SizedBox(width: 5,),
                Text('Leer noticia')
              ],
            ),
            type: 'error',
            size: 'md',
            onPressed: () {},
          ),
        ),


        Divider()
      ],
    );
  }
}
