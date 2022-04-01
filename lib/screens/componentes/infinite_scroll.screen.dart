import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/ui/ui.dart';
import '/services/services.dart';
import '/models/modes.dart';
import '/widgets/widgets.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({Key? key}) : super(key: key);

  @override
  _InfiniteScrollScreenState createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  NewsService _newsService = new NewsService();
  ScrollController _scrollController = new ScrollController();  
  int _page = 1;
  List<Article> _articulos = [];
  bool _isLoading = true;
  bool _cargandoMasResultados = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      // cargar los primeros resultados de noticias
      _newsService.getArticles(page: _page).then((value) {
        setState(() {
          _articulos = value;
          _isLoading = false;
        });
      });
      //print(_articulos);
    
    // listener para cargar mas resultados al llegar a la ultima noticia
    _scrollController..addListener(() async {
      if(_scrollController.position.pixels > (_scrollController.position.maxScrollExtent - 100) &&  _articulos.length < _newsService.maxNoticias && _cargandoMasResultados == false){
        
        _cargandoMasResultados = true;

        _articulos..addAll(await _newsService.getArticles(page: ++_page));

        _scrollController.animateTo(
          _scrollController.position.pixels + 200, 
          duration: Duration(seconds: 1), 
          curve: Curves.fastOutSlowIn
        );

        _cargandoMasResultados = false;

        setState(() {
          
        });
      }
    });
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose(); //destruir el listener
    super.dispose();
    
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Infinte Scroll'),
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Stack(
          children: [
            ListView.builder(      
              controller: _scrollController,        
              itemCount: _articulos.length,
              itemBuilder: (BuildContext context, int index) {
                return ArticleCardWidget( articulo: _articulos[index], index: index, );
              },
            ),

            _isLoading ? LoaderWidget() : Container()
          ],
        ),
      ),
    );
  }
}

// widget para la tarjeta de noticia
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
            onPressed: () async {
              if (!await launch(articulo.url)) throw 'Could not launch ${articulo.url}';
            },
          ),
        ),


        Divider()
      ],
    );
  }
}
