
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../Models/slider_models.dart';

class NewsAPISlider{
  List<SliderModels> newsSlider = [];


  Future<void> getNewsSliders() async{
    String urlApi = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=4bed3d07d0274ad39620df62fcbb1d80";

    var response = await http.get(Uri.parse(urlApi));
    var jsonData = convert.jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null ) {
          SliderModels sliderModels = SliderModels(
            title: element["title"],
            descriptions: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          newsSlider.add(sliderModels);
        }
      });
    }

  }

}