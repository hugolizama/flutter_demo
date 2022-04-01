import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/modes.dart';

class NewsService extends ChangeNotifier {
  String _baseUrl = dotenv.env['news_baseUrl'].toString();
  String _country = 'us';
  int _pageSize = 5;
  late int maxNoticias;
  String _apiKey = dotenv.env['news_apiKey'].toString();

  //List<Article> articles = [];


  Future<List<Article>> getArticles({ int page = 1 }) async {
    final url = Uri.parse('${ this._baseUrl }/top-headlines?country=${ this._country }&pageSize=${ this._pageSize }&page=${ page }&apiKey=${ this._apiKey }');
    final resp = await http.get(url);
    final newsResponse = News.fromJson( resp.body );
    maxNoticias = newsResponse.totalResults;

    return newsResponse.articles;


    // prueba cuando se acaba el num de peticiones gratis en la api
    /*maxNoticias = 12;
    final newsResponse = News.fromJson( await rootBundle.loadString("assets/json/${ page }.json") );
    return newsResponse.articles;*/
  }
}
