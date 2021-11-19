import 'dart:convert';

import 'package:first_try_null_safety/model.dart';
import 'package:http/http.dart';

class Api {
  String api_key = "a05d5478ab434c87bcbac5df875ba9b9";
  String url =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a05d5478ab434c87bcbac5df875ba9b9";
  Future<List<Article>?> apiNoW() async {
    var api = Uri.parse("$url");

    Response response = await get(api);

    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Article>? articlesData = Model.fromJson(data).articles;
      return articlesData;
    } else {
      throw Exception();
    }
  }
}
