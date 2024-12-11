import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/articlas_response.dart';
import 'package:news_app/model/sources_response.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=bf880877d9804fd89dcb2b1f5028cfcb
class Api {
  static String baseUrl = "newsapi.org";
  static Future<SoursResponse> getSours(String categoryId) async {
    Uri url = Uri.https(baseUrl, "/v2/top-headlines/sources",
        {"apiKey": "bf880877d9804fd89dcb2b1f5028cfcb", "category": categoryId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SoursResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=bf880877d9804fd89dcb2b1f5028cfcb&sources=bbc-sport
  static Future<ArticlesResponse> getNewsArticle(String sourcesId) async {
    Uri url = Uri.https(baseUrl, "/v2/everything", {
      "apiKey": "bf880877d9804fd89dcb2b1f5028cfcb",
      "q": "bitcoin",
      "sources": sourcesId
    });
    var response = await http.get(url);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    return ArticlesResponse.fromJson(json);
  }
}
