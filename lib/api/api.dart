import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/sources_response.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=bf880877d9804fd89dcb2b1f5028cfcb
class Api {
  static Future<SoursResponse> getSours() async {
    try {
      var response = await http.get(Uri.https(
          "newsapi.org",
          "/v2/top-headlines/sources",
          {"apiKey": "bf880877d9804fd89dcb2b1f5028cfcb"}));
      return SoursResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
