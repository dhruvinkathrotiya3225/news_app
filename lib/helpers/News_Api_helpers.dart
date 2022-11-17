import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/news.dart';

class News_API_Helpers {
  News_API_Helpers._();

  static final News_API_Helpers news_api_helpers = News_API_Helpers._();

  Future<List<NewsData>?> featchAPIdata({required String APi}) async {
    http.Response res = await http.get(Uri.parse(APi));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodecode = jsonDecode(res.body);
      List news = decodecode["articles"];
      List<NewsData> newsData =
          news.map((e) => NewsData.fromMap(data: e)).toList();

      return newsData;
    }
  }
}
