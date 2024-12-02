import 'dart:convert';

import 'package:newsapp/api/constat_api.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/NewsModel.dart';
import 'package:newsapp/models/Sources_model.dart';

class ApiServies {
  static Future<SourceModel> getSources(String CategoryId) async {
    var url = Uri.https(ApiConst.baseUrl, ApiConst.SourceEndPoint,
        {'apiKey': ApiConst.ApiKey, 'category': CategoryId});
    var respons = await http.get(url);
    String body = respons.body;
    var json = jsonDecode(body);
    return SourceModel.fromJson(json);
  }

   static Future<NewsModel> getNews(String sourceId) async {
    var url = Uri.https(ApiConst.baseUrl, ApiConst.NewsEndPoint,
        {'apiKey': ApiConst.ApiKey, 'sources':sourceId });
    var respons = await http.get(url);
    String body = respons.body;
    var json = jsonDecode(body);
    return NewsModel.fromJson(json);
  }

  static Future<NewsModel> SearchNews(String query) async {
    var url = Uri.https(ApiConst.baseUrl, ApiConst.NewsEndPoint,
        {'apiKey': ApiConst.ApiKey, 'query':query });
    var respons = await http.get(url);
    String body = respons.body;
    var json = jsonDecode(body);
    return NewsModel.fromJson(json);
  }
}
