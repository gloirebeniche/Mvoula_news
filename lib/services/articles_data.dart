import '../Models/article_models.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class NewsAPI{
  List<ArticleModels> news = [];


  Future<void> getNews() async{
    // String urlApi = "https://newsapi.org/v2/everything?q=tesla&from=2024-03-03&sortBy=publishedAt&apiKey=4bed3d07d0274ad39620df62fcbb1d80";
    String urlApi = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=4bed3d07d0274ad39620df62fcbb1d80";

    var response = await http.get(Uri.parse(urlApi));
    var jsonData = convert.jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null ) {
          ArticleModels articleModels = ArticleModels(
            title: element["title"],
            descriptions: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModels);
        }
      });
    }

}

}