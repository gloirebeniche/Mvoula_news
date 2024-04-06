
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../Models/show_categorie_models.dart';

class ShowCategorieDataNews{
  List<ShowCategorieModels> categoryShowModelList = [];


  Future<void> getNewsCategorieData(String categoriesNameParms) async{
    // String urlApi = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4bed3d07d0274ad39620df62fcbb1d80";
    String urlApi = "https://newsapi.org/v2/top-headlines?country=us&category=$categoriesNameParms&apiKey=4bed3d07d0274ad39620df62fcbb1d80";

    var response = await http.get(Uri.parse(urlApi));
    var jsonData = convert.jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null ) {
          ShowCategorieModels showCategorieModels = ShowCategorieModels(
            title: element["title"],
            descriptions: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          categoryShowModelList.add(showCategorieModels);
        }
      });
    }

  }

}